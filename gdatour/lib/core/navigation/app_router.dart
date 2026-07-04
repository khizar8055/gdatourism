import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/region_detail_screen.dart';
import '../../features/home/presentation/screens/explore_screen.dart';
import '../../features/home/presentation/screens/profile_screen.dart';
import '../../features/home/presentation/screens/weather_screen.dart';
import '../../features/home/presentation/screens/map_screen.dart';
import '../../features/home/presentation/screens/emergency_screen.dart';
import '../../features/home/providers/home_provider.dart';
import '../../features/admin/presentation/screens/admin_dashboard_screen.dart';
import '../../features/admin/presentation/screens/add_hotel_screen.dart';
import '../../features/admin/presentation/screens/add_petrol_pump_screen.dart';
import '../../features/admin/presentation/screens/add_hospital_screen.dart';
import '../splash_screen.dart';

// Placeholder Screens for navigation
class RegionDetailPlaceholder extends ConsumerWidget {
  final String regionId;

  const RegionDetailPlaceholder({required this.regionId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final region = homeState.featuredRegions.firstWhere(
      (r) => r.id == regionId,
      orElse: () => homeState.featuredRegions.first,
    );

    return RegionDetailScreen(region: region);
  }
}

// MapScreen is now GdaMapScreen — imported from map_screen.dart

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'region/:regionId',
              builder: (context, state) {
                final regionId = state.pathParameters['regionId']!;
                return RegionDetailPlaceholder(regionId: regionId);
              },
            ),
            GoRoute(
              path: 'weather',
              builder: (context, state) => const WeatherScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/explore',
          builder: (context, state) => const ExploreScreen(),
          routes: [
            GoRoute(
              path: 'map',
              builder: (context, state) {
                final cat = state.uri.queryParameters['category'];
                PoiCategory? initialCat;
                if (cat == 'hotel') initialCat = PoiCategory.hotel;
                if (cat == 'hospital') initialCat = PoiCategory.hospital;
                if (cat == 'fuel') initialCat = PoiCategory.fuelPump;
                if (cat == 'attraction') initialCat = PoiCategory.attraction;
                if (cat == 'restaurant') initialCat = PoiCategory.restaurant;
                if (cat == 'parking') initialCat = PoiCategory.parking;

                final regionId = state.uri.queryParameters['region'];
                final poiId = state.uri.queryParameters['poi'];

                return GdaMapScreen(
                  initialCategory: initialCat,
                  initialRegionId: regionId,
                  initialPoiId: poiId,
                );
              },
            ),
            GoRoute(
              path: 'emergency',
              builder: (context, state) => const EmergencyScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) {
            final cat = state.uri.queryParameters['category'];
            PoiCategory? initialCat;
            if (cat == 'hotel') initialCat = PoiCategory.hotel;
            if (cat == 'hospital') initialCat = PoiCategory.hospital;
            if (cat == 'fuel') initialCat = PoiCategory.fuelPump;
            if (cat == 'attraction') initialCat = PoiCategory.attraction;
            if (cat == 'restaurant') initialCat = PoiCategory.restaurant;
            if (cat == 'parking') initialCat = PoiCategory.parking;

            final regionId = state.uri.queryParameters['region'];
            final poiId = state.uri.queryParameters['poi'];

            return GdaMapScreen(
              initialCategory: initialCat,
              initialRegionId: regionId,
              initialPoiId: poiId,
            );
          },
        ),
        GoRoute(
          path: '/emergency',
          builder: (context, state) => const EmergencyScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminDashboardScreen(),
          routes: [
            GoRoute(
              path: 'add-hotel',
              builder: (context, state) => const AddHotelScreen(),
            ),
            GoRoute(
              path: 'add-petrol-pump',
              builder: (context, state) => const AddPetrolPumpScreen(),
            ),
            GoRoute(
              path: 'add-hospital',
              builder: (context, state) => const AddHospitalScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({required this.child, super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/explore')) return 1;
    if (location.startsWith('/map')) return 2;
    if (location.startsWith('/emergency')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/explore');
        break;
      case 2:
        context.go('/map');
        break;
      case 3:
        context.go('/emergency');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    final router = GoRouter.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      // Allow pop only when GoRouter itself can go back (e.g., region detail screen)
      canPop: router.canPop(),
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // If not on home tab, navigate to home tab first
        if (selectedIndex != 0) {
          context.go('/');
        } else {
          // Already on home tab - close app
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: child,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? AppColors.darkShadow.withValues(alpha: 0.35) : AppColors.lightShadow.withValues(alpha: 0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 8),
                    spreadRadius: -4,
                  ),
                ],
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => _onItemTapped(index, context),
                  height: 80,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  indicatorColor: colorScheme.primaryContainer,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined, size: 26),
                      selectedIcon: Icon(Icons.home_rounded, size: 28),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.explore_outlined, size: 26),
                      selectedIcon: Icon(Icons.explore_rounded, size: 28),
                      label: 'Explore',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.map_outlined, size: 26),
                      selectedIcon: Icon(Icons.map_rounded, size: 28),
                      label: 'Map',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.emergency_outlined, size: 26),
                      selectedIcon: Icon(Icons.emergency_rounded, size: 28),
                      label: 'Emergency',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline_rounded, size: 26),
                      selectedIcon: Icon(Icons.person_rounded, size: 28),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
