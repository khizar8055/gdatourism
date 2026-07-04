import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import 'package:gda_tourism/core/providers/theme_provider.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';
import '../../providers/home_provider.dart';
import '../../data/models/quick_action_model.dart';
import '../../data/models/weather_model.dart';
import '../widgets/region_selector.dart';
import '../widgets/attraction_card.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final visibleActions = homeState.quickActions
        .where(
          (action) =>
              action.iconKey != 'map' &&
              action.iconKey != 'weather' &&
              action.iconKey != 'emergency',
        )
        .toList();

    final regions = homeState.featuredRegions;
    final selectedRegion =
        homeState.selectedRegion ?? (regions.isNotEmpty ? regions.first : null);
    final currentWeather = homeState.currentWeather;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          GdaSliverAppHeader(
            title: 'Explore',
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    ref.read(themeModeProvider.notifier).toggleTheme();
                  },
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Explore Galiyat',
                              style: GoogleFonts.manrope(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Services, weather & attractions',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: colorScheme.onSurface.withValues(alpha: 0.65),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (selectedRegion != null)
                        RegionSelector(
                          regions: regions,
                          selectedRegion: selectedRegion,
                          onRegionSelected: homeNotifier.selectRegion,
                          isDarkBackground: false,
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Quick Services',
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final action = visibleActions[index];
                  return _ExploreActionCard(
                    action: action,
                    weather: action.iconKey == 'weather' ? currentWeather : null,
                    onTap: () => _handleAction(context, ref, action),
                  );
                },
                childCount: visibleActions.length,
              ),
            ),
          ),
          if (homeState.attractions.isNotEmpty) ...[
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Popular Attractions',
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  separatorBuilder: (context, index) => const SizedBox(width: 14),
                  itemCount: homeState.attractions.length,
                  itemBuilder: (context, index) {
                    final attraction = homeState.attractions[index];
                    return AttractionCard(
                      attraction: attraction,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Opening track info for ${attraction.name}.'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
          const SliverToBoxAdapter(
            child: SizedBox(height: 120),
          ),
        ],
      ),
    );
  }

  String _regionParam(WidgetRef ref) {
    final regionId = ref.read(homeProvider).selectedRegion?.id ?? 'nathia_gali';
    return 'region=$regionId';
  }

  void _handleAction(
      BuildContext context, WidgetRef ref, QuickActionModel action) {
    final region = _regionParam(ref);

    switch (action.iconKey) {
      case 'map':
        context.go('/explore/map?$region');
        break;

      case 'weather':
        context.go('/weather');
        break;

      case 'emergency':
        context.go('/explore/emergency');
        break;

      case 'hotel':
        context.go('/explore/map?category=hotel&$region');
        break;

      case 'hospital':
        context.go('/explore/map?category=hospital&$region');
        break;

      case 'restaurant':
        context.go('/explore/map?category=restaurant&$region');
        break;

      case 'petrol':
        context.go('/explore/map?category=fuel&$region');
        break;

      case 'parking':
        context.go('/explore/map?category=parking&$region');
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${action.title} — coming soon!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
            ),
            elevation: 4,
          ),
        );
    }
  }
}

class _ExploreActionCard extends StatelessWidget {
  final QuickActionModel action;
  final WeatherModel? weather;
  final VoidCallback onTap;

  const _ExploreActionCard({
    required this.action,
    this.weather,
    required this.onTap,
  });

  IconData _getIcon(String key) {
    switch (key) {
      case 'map':
        return Icons.map_rounded;
      case 'weather':
        return Icons.wb_sunny_rounded;
      case 'emergency':
        return Icons.emergency_rounded;
      case 'hotel':
        return Icons.hotel_rounded;
      case 'hospital':
        return Icons.local_hospital_rounded;
      case 'restaurant':
        return Icons.restaurant_rounded;
      case 'petrol':
        return Icons.local_gas_station_rounded;
      case 'parking':
        return Icons.local_parking_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }

  Color _getIconColor(String key) {
    switch (key) {
      case 'hotel':
        return const Color(0xFFD97706);
      case 'hospital':
        return const Color(0xFF0D9488);
      case 'restaurant':
        return const Color(0xFFDB2777);
      case 'petrol':
        return const Color(0xFF4F46E5);
      case 'parking':
        return const Color(0xFF6B7280);
      default:
        return const Color(0xFF66BB6A);
    }
  }

  String _getSubtitle(String key) {
    switch (key) {
      case 'map':
        return 'GDA Map Explorer';
      case 'weather':
        return 'Live forecast';
      case 'emergency':
        return 'Ambulance & rescue';
      case 'hotel':
        return 'Find nearby hotels';
      case 'hospital':
        return 'Medical centers';
      case 'restaurant':
        return 'Dining options';
      case 'petrol':
        return 'Fuel stations';
      case 'parking':
        return 'Parking spots';
      default:
        return '';
    }
  }

  bool _navigatesToMap(String key) =>
      key == 'map' ||
      key == 'hotel' ||
      key == 'hospital' ||
      key == 'petrol' ||
      key == 'restaurant' ||
      key == 'parking';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final icon = _getIcon(action.iconKey);
    final iconColor = _getIconColor(action.iconKey);
    final subtitle = _getSubtitle(action.iconKey);
    final goesToMap = _navigatesToMap(action.iconKey);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 32),
              ),
              const Spacer(),
              Text(
                action.title,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                action.iconKey == 'weather' && weather != null
                    ? '${weather!.temperature.toStringAsFixed(0)}°C • ${weather!.condition}'
                    : subtitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  fontWeight: action.iconKey == 'weather' && weather != null
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      goesToMap
                          ? Icons.map_outlined
                          : action.iconKey == 'weather'
                              ? Icons.cloud_rounded
                              : action.iconKey == 'emergency'
                                  ? Icons.warning_rounded
                                  : Icons.info_outline_rounded,
                      size: 16,
                      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      goesToMap
                          ? 'View On Map'
                          : action.iconKey == 'weather'
                              ? 'View Forecast'
                              : action.iconKey == 'emergency'
                                  ? 'Helplines'
                                  : 'View Details',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
