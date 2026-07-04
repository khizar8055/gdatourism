import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  static const _helplines = [
    _Helpline(
      name: 'Emergency (Rescue 1122)',
      number: '1122',
      icon: Icons.emergency_rounded,
      description: 'Ambulance, fire, and rescue support 24/7',
      priority: _Priority.critical,
    ),
    _Helpline(
      name: 'Police Emergency',
      number: '15',
      icon: Icons.local_police_rounded,
      description: 'Police helpline for immediate assistance',
      priority: _Priority.high,
    ),
    _Helpline(
      name: 'GDA Tourist Helpline',
      number: '+92-992-355-000',
      icon: Icons.support_agent_rounded,
      description: 'Galiyat Development Authority assistance desk',
      priority: _Priority.normal,
    ),
    _Helpline(
      name: 'Highway Police',
      number: '130',
      icon: Icons.directions_car_rounded,
      description: 'Murree Expressway and road emergency support',
      priority: _Priority.high,
    ),
    _Helpline(
      name: 'Edhi Ambulance',
      number: '115',
      icon: Icons.medical_services_rounded,
      description: 'Private ambulance service hotline',
      priority: _Priority.normal,
    ),
  ];

  Future<void> _callNumber(BuildContext context, String number) async {
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to open dialer right now.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: CustomScrollView(
        slivers: [
          GdaSliverAppHeader(
            title: 'Emergency Services',
            showBackButton: true,
            onBackPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHero(context),
                  const SizedBox(height: 16),
                  _buildEmergencyTips(context),
                  const SizedBox(height: 20),
                  Text(
                    'Quick Dial',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.separated(
              itemCount: _helplines.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final h = _helplines[index];
                return _HelplineCard(
                  helpline: h,
                  onCall: () => _callNumber(context, h.number),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.error,
            colorScheme.errorContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.onError, size: 34),
          const SizedBox(height: 10),
          Text(
            'Emergency Helplines',
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onError,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'For medical, road, or security emergencies in Galiyat, call the relevant service immediately.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onError.withValues(alpha: 0.86),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyTips(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, color: colorScheme.onSecondaryContainer),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'During rain or fog, drive slow on Murree Expressway and keep emergency numbers accessible.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSecondaryContainer,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _Priority { critical, high, normal }

class _Helpline {
  final String name;
  final String number;
  final IconData icon;
  final String description;
  final _Priority priority;

  const _Helpline({
    required this.name,
    required this.number,
    required this.icon,
    required this.description,
    required this.priority,
  });
}

class _HelplineCard extends StatelessWidget {
  final _Helpline helpline;
  final VoidCallback onCall;

  const _HelplineCard({required this.helpline, required this.onCall});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final colors = _priorityColors(helpline.priority, colorScheme);

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onCall,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outline),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: colors.iconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(helpline.icon, color: colors.iconFg, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      helpline.name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      helpline.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              FilledButton.icon(
                onPressed: onCall,
                icon: const Icon(Icons.phone_rounded, size: 16),
                label: Text(
                  helpline.number,
                  style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _PriorityPalette _priorityColors(_Priority priority, ColorScheme colorScheme) {
    switch (priority) {
      case _Priority.critical:
        return _PriorityPalette(
          iconBg: colorScheme.errorContainer,
          iconFg: colorScheme.error,
        );
      case _Priority.high:
        return _PriorityPalette(
          iconBg: colorScheme.secondaryContainer,
          iconFg: colorScheme.secondary,
        );
      case _Priority.normal:
        return _PriorityPalette(
          iconBg: colorScheme.primaryContainer,
          iconFg: colorScheme.primary,
        );
    }
  }
}

class _PriorityPalette {
  final Color iconBg;
  final Color iconFg;

  const _PriorityPalette({required this.iconBg, required this.iconFg});
}
