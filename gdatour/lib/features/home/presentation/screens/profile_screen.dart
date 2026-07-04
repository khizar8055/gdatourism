import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import 'package:gda_tourism/core/providers/theme_provider.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          GdaSliverAppHeader(
            title: 'Profile',
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                      .withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
                  icon: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    size: 22,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileHeroCard(isDark: isDark, colorScheme: colorScheme),
                  const SizedBox(height: 28),
                  Text(
                    'Account',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileMenuTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Edit Profile',
                    subtitle: 'Update your personal information',
                    onTap: () => _showComingSoon(context, 'Edit Profile'),
                  ),
                  _ProfileMenuTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage alerts and travel updates',
                    onTap: () => _showComingSoon(context, 'Notifications'),
                  ),
                  _ProfileMenuTile(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    subtitle: 'App preferences and privacy',
                    onTap: () => _showComingSoon(context, 'Settings'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Support',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileMenuTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Support',
                    subtitle: 'FAQs and contact assistance',
                    onTap: () => _showComingSoon(context, 'Help & Support'),
                  ),
                  _ProfileMenuTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About GDA Tourism',
                    subtitle: 'Version 1.0.0 • Galiyat Development Authority',
                    onTap: () => _showAboutDialog(context),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Administration',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ProfileMenuTile(
                    icon: Icons.admin_panel_settings_outlined,
                    title: 'Admin Portal',
                    subtitle: 'Manage hotels, hospitals, and fuel stations',
                    iconColor: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
                    onTap: () => context.go('/admin'),
                  ),
                  const SizedBox(height: 16),
                  _ProfileMenuTile(
                    icon: Icons.logout_rounded,
                    title: 'Sign Out',
                    subtitle: 'Log out of your account',
                    titleColor: colorScheme.error,
                    iconColor: colorScheme.error,
                    showChevron: false,
                    onTap: () => _showComingSoon(context, 'Sign Out'),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature is coming soon.'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'About GDA Tourism',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w800),
        ),
        content: Text(
          'Official tourism guide for Galiyat by the Galiyat Development Authority. '
          'Explore regions, weather, maps, emergency services, and local attractions.',
          style: GoogleFonts.inter(height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeroCard extends StatelessWidget {
  final bool isDark;
  final ColorScheme colorScheme;

  const _ProfileHeroCard({
    required this.isDark,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isDark ? AppColors.darkAppBar : AppColors.lightAppBar,
            isDark ? AppColors.darkPrimaryContainer : AppColors.lightPrimaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/gda_logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.person_rounded,
                  size: 36,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Traveler',
                  style: GoogleFonts.manrope(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Galiyat Development Authority',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: (isDark ? AppColors.darkTextSecondary : AppColors.lightTextOnPrimary)
                        .withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: (isDark ? AppColors.darkSecondary : AppColors.lightSecondary)
                        .withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Verified Tourist Account',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? titleColor;
  final Color? iconColor;
  final bool showChevron;

  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.titleColor,
    this.iconColor,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveIconColor = iconColor ?? colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: effectiveIconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: effectiveIconColor, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.manrope(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: titleColor ?? colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showChevron)
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colorScheme.onSurface.withValues(alpha: 0.4),
                    size: 22,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
