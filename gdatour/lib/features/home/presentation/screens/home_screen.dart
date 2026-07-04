import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'package:gda_tourism/core/constants/app_colors.dart';
import 'package:gda_tourism/core/providers/theme_provider.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';
import '../../providers/home_provider.dart';
import '../../data/models/quick_action_model.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/attraction_card.dart';
import '../widgets/travel_alert_card.dart';
import '../widgets/region_selector.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: RefreshIndicator(
        onRefresh: homeNotifier.refreshData,
        color: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // App Bar
            GdaSliverAppHeader(
              title: 'GDA TOURISM',
              showLogo: true,
              actions: [
                // Theme Toggle
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
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return RotationTransition(
                          turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                          child: FadeTransition(opacity: animation, child: child),
                        );
                      },
                      child: Icon(
                        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                        key: ValueKey(isDark),
                        size: 22,
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                      ),
                    ),
                  ),
                ),
                // Notifications
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: (isDark ? AppColors.darkPrimary : AppColors.lightPrimary).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                      size: 22,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Notifications screen is under construction.',
                            style: GoogleFonts.inter(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: colorScheme.outline, width: 1),
                          ),
                          elevation: 4,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 18),
              ],
            ),
            // Body Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    // Welcome Section
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
                      'Discover beautiful regions, weather updates, and local attractions',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Image Carousel
                    const AutoSlidingCarousel(),
                    const SizedBox(height: 24),
                    // Quick Actions
                    Text(
                      'Quick Actions',
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    QuickActionGrid(
                      actions: homeState.quickActions,
                      onActionTap: (action) {
                        switch (action.route) {
                          case '/map':
                            context.go('/map');
                            break;
                          case '/weather':
                            context.go('/weather');
                            break;
                          case '/emergency':
                            context.go('/emergency');
                            break;
                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${action.title} is under construction.'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    // Weather Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Weather',
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        RegionSelector(
                          regions: homeState.featuredRegions,
                          selectedRegion: homeState.selectedRegion,
                          onRegionSelected: (region) => homeNotifier.selectRegion(region),
                          isDarkBackground: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => context.go('/weather'),
                      child: CurrentWeatherCard(
                        weather: homeState.currentWeather,
                        onViewForecast: () => context.go('/weather'),
                        selectedRegion: homeState.selectedRegion,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Hotels Section
                    Text(
                      'Hotels',
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (homeState.selectedRegion != null) ...[
                      _HotelsSection(
                        regionName: homeState.selectedRegion!.name,
                        hotels: homeState.selectedRegion!.hotels,
                      ),
                    ],
                    const SizedBox(height: 24),
                    // Popular Attractions
                    Text(
                      'Popular Attractions',
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
            // Attractions List (Horizontal)
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: homeState.attractions.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 14),
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
            // Travel Alerts Section
            if (homeState.travelAlerts.isNotEmpty) ...[
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    'Active Travel Alerts',
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemCount: homeState.travelAlerts.length,
                  itemBuilder: (context, index) {
                    final alert = homeState.travelAlerts[index];
                    return TravelAlertCard(
                      alert: alert,
                      onTap: () {
                        _showAlertDetails(context, alert.title, alert.message);
                      },
                    );
                  },
                ),
              ),
            ],
            // Bottom Spacer
            const SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDetails(BuildContext context, String title, String msg) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        title: Text(
          title,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Text(msg, style: GoogleFonts.inter()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Dismiss',
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

class AutoSlidingCarousel extends ConsumerStatefulWidget {
  const AutoSlidingCarousel({super.key});

  @override
  ConsumerState<AutoSlidingCarousel> createState() => _AutoSlidingCarouselState();
}

class _AutoSlidingCarouselState extends ConsumerState<AutoSlidingCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _banners = [
    {
      'title': 'Queen of hills - Murree',
      'region': 'Murree',
      'url': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&auto=format&fit=crop&q=80'
    },
    {
      'title': 'Scenic Nathia Gali',
      'region': 'Nathia Gali',
      'url': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=800&auto=format&fit=crop&q=80'
    },
    {
      'title': 'Ayubia National Park',
      'region': 'Ayubia',
      'url': 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800&auto=format&fit=crop&q=80'
    },
    {
      'title': 'Serene Thandiani',
      'region': 'Thandiani',
      'url': 'https://images.unsplash.com/photo-1464278533981-50106e6176b1?w=800&auto=format&fit=crop&q=80'
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _showRegionDetails(BuildContext context, String regionName) {
    final homeState = ref.read(homeProvider);
    final region = homeState.featuredRegions.firstWhere(
      (r) => r.name.toLowerCase() == regionName.toLowerCase(),
      orElse: () => homeState.featuredRegions.first,
    );

    context.go('/region/${region.id}');
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.darkSecondary : AppColors.lightSecondary;

    return Column(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _banners.length,
              itemBuilder: (context, index) {
                final banner = _banners[index];
                return GestureDetector(
                  onTap: () => _showRegionDetails(context, banner['region']!),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        banner['url']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: colorScheme.surfaceContainerHighest,
                            child: Icon(Icons.broken_image_rounded, size: 48, color: colorScheme.onSurface),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withValues(alpha: 0.85),
                              Colors.black.withValues(alpha: 0.0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [0.0, 0.6],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                banner['region']!.toUpperCase(),
                                style: GoogleFonts.inter(
                                  color: isDark ? AppColors.darkTextOnSecondary : AppColors.lightTextOnSecondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              banner['title']!,
                              style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.5,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: _currentPage == index ? 4 : 3),
              height: 5,
              width: _currentPage == index ? 28 : 7,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? colorScheme.primary
                    : colorScheme.outline.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HotelsSection extends StatefulWidget {
  final String regionName;
  final List<String> hotels;

  const _HotelsSection({
    required this.regionName,
    required this.hotels,
  });

  @override
  State<_HotelsSection> createState() => _HotelsSectionState();
}

class _HotelsSectionState extends State<_HotelsSection> {
  int _selectedIndex = 0;

  @override
  void didUpdateWidget(covariant _HotelsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.regionName != widget.regionName || oldWidget.hotels.length != widget.hotels.length) {
      _selectedIndex = 0;
    }
  }

  _HotelViewData _parseHotel(String rawHotel, int index) {
    final parts = rawHotel.split('|');
    final name = parts.first.trim();
    final imageUrl = parts.length > 1 ? parts[1].trim() : '';
    final note = imageUrl.isEmpty
        ? 'Full hotel details and photos will appear once connected to the live database.'
        : 'Live data se loaded hotel preview.';

    return _HotelViewData(
      name: name,
      imageUrl: imageUrl,
      note: note,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (widget.hotels.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outline, width: 1),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.hotel_rounded,
                size: 52,
                color: colorScheme.outline,
              ),
              const SizedBox(height: 14),
              Text(
                'No hotels available for this region',
                style: GoogleFonts.inter(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final selected = _parseHotel(widget.hotels[_selectedIndex], _selectedIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Chips
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.hotels.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final hotel = _parseHotel(widget.hotels[index], index);
              final isSelected = _selectedIndex == index;
              return FilterChip(
                selected: isSelected,
                onSelected: (_) => setState(() => _selectedIndex = index),
                label: Text(
                  hotel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                  ),
                ),
                backgroundColor: isSelected ? colorScheme.primaryContainer : colorScheme.surface,
                selectedColor: colorScheme.primaryContainer,
                checkmarkColor: colorScheme.primary,
                side: BorderSide(
                  color: isSelected ? colorScheme.primary : colorScheme.outline,
                  width: isSelected ? 1.5 : 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Hotel Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outline, width: 1),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    selected.imageUrl.isNotEmpty
                        ? selected.imageUrl
                        : 'https://source.unsplash.com/1200x675/?${Uri.encodeComponent('${widget.regionName} ${selected.name} resort hotel')}',
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stackTrace) {
                      return Container(
                        color: colorScheme.surfaceContainerHighest,
                        child: Center(
                          child: Icon(
                            Icons.hotel_rounded,
                            size: 52,
                            color: colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selected.name,
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selected.note,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Hotel booking is under construction.'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        icon: const Icon(Icons.book_rounded, size: 20),
                        label: Text(
                          'Book Now',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HotelViewData {
  final String name;
  final String imageUrl;
  final String note;

  const _HotelViewData({
    required this.name,
    required this.imageUrl,
    required this.note,
  });
}

class QuickActionGrid extends StatelessWidget {
  final List<QuickActionModel> actions;
  final Function(QuickActionModel) onActionTap;

  const QuickActionGrid({
    required this.actions,
    required this.onActionTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.65,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return QuickActionCard(
          action: action,
          onTap: () => onActionTap(action),
        );
      },
    );
  }
}
