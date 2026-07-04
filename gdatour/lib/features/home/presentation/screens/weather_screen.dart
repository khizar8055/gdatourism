import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';
import '../../providers/home_provider.dart';
import '../../data/models/weather_model.dart';
import '../widgets/region_selector.dart';
import '../../../../core/constants/app_colors.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeRepository = ref.read(homeRepositoryProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final regions = homeState.featuredRegions;
    final selectedRegion =
        homeState.selectedRegion ?? (regions.isNotEmpty ? regions.first : null);

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: selectedRegion == null
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                GdaSliverAppHeader(
                  title: 'Weather Forecast',
                  showBackButton: true,
                  onBackPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Live regional weather, travel guidance, and weekly trend.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.75),
                          ),
                        ),
                        const SizedBox(height: 14),
                        RegionSelector(
                          regions: regions,
                          selectedRegion: selectedRegion,
                          onRegionSelected: (region) =>
                              ref.read(homeProvider.notifier).selectRegion(region),
                          isDarkBackground: isDark,
                        ),
                        const SizedBox(height: 24),

                        // Weather display builder
                        FutureBuilder<WeatherModel>(
                          future: homeRepository.getCurrentWeather(selectedRegion.name),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return _buildLoadingCard(context);
                            }
                            if (snapshot.hasError) {
                              return _buildErrorCard(context, selectedRegion.name);
                            }
                            final weather = snapshot.data;
                            if (weather == null) {
                              return _buildErrorCard(context, selectedRegion.name);
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildWeatherCard(context, selectedRegion, weather),
                                const SizedBox(height: 16),
                                _buildKeyMetrics(context, weather),
                                const SizedBox(height: 16),
                                _buildHourlyForecast(context, weather),
                                const SizedBox(height: 16),
                                _buildTravelAdvisoryCard(context, weather),
                                const SizedBox(height: 16),
                                _buildWeeklyForecastSection(context, weather),
                                const SizedBox(height: 96),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildWeatherCard(
    BuildContext context,
    dynamic region,
    dynamic weather,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        region.name,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        region.shortDescription,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimaryContainer.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _getWeatherIcon(
                    context,
                    weather?.condition ?? 'Cloudy',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${weather?.temperature ?? 0}°C',
                  style: textTheme.displaySmall?.copyWith(
                    fontSize: 56,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather?.condition ?? 'Loading...',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            Icons.water_drop_rounded,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Humidity: ${weather?.humidity ?? 0}%',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.air_rounded,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Wind: ${weather?.windSpeed ?? 0} km/h',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, String regionName) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                size: 40),
            const SizedBox(height: 12),
            Text(
              'Failed to load weather for $regionName',
              style: textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWeatherIcon(BuildContext context, String condition) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    IconData iconData;
    switch (condition.toLowerCase()) {
      case 'sunny':
        iconData = Icons.wb_sunny_rounded;
        break;
      case 'rainy':
      case 'heavy rain':
        iconData = Icons.water_drop_rounded;
        break;
      case 'foggy':
      case 'mist':
        iconData = Icons.cloud_rounded;
        break;
      case 'cloudy':
      default:
        iconData = Icons.cloud_rounded;
    }
    return Icon(
      iconData,
      size: 52,
      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
    );
  }

  Widget _buildKeyMetrics(BuildContext context, WeatherModel weather) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final feelsLike = weather.temperature - 1;
    final visibility = (12 - (weather.humidity / 12)).clamp(2, 12).toDouble();

    Widget metricCard({
      required IconData icon,
      required String label,
      required String value,
    }) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outline),
          ),
          child: Column(
            children: [
              Icon(icon, color: colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        metricCard(
          icon: Icons.thermostat_rounded,
          label: 'Feels Like',
          value: '${feelsLike.toStringAsFixed(1)}°C',
        ),
        const SizedBox(width: 10),
        metricCard(
          icon: Icons.air_rounded,
          label: 'Wind',
          value: '${weather.windSpeed.toStringAsFixed(1)} km/h',
        ),
        const SizedBox(width: 10),
        metricCard(
          icon: Icons.visibility_rounded,
          label: 'Visibility',
          value: '${visibility.toStringAsFixed(1)} km',
        ),
      ],
    );
  }

  Widget _buildHourlyForecast(BuildContext context, WeatherModel weather) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hours = _getHourlyForecast(weather);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '24-Hour Outlook',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 126,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: hours.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final hour = hours[index];
              return Container(
                width: 92,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Column(
                  children: [
                    Text(hour['time'] as String, style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    Icon(
                      _getMiniWeatherIcon(hour['condition'] as String),
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(hour['temp'] as double).toStringAsFixed(0)}°',
                      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTravelAdvisoryCard(BuildContext context, WeatherModel weather) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String status = 'Recommended';
    String desc = 'Pleasant weather for traveling.';
    Color cardBackgroundColor;
    Color textColor;
    Color iconColor;
    IconData icon;

    final primary = colorScheme.primary;
    final primaryContainer = colorScheme.primaryContainer;

    final condition = weather.condition.toLowerCase();
    if (condition.contains('rain') || condition.contains('storm')) {
      status = 'High Risk - Travel Not Recommended';
      desc =
          'Roads in Galiyat are extremely slippery during heavy rains. High risk of landslides in steep areas. Please avoid traveling unless absolutely necessary.';
      cardBackgroundColor = colorScheme.errorContainer;
      textColor = colorScheme.onErrorContainer;
      iconColor = colorScheme.error;
      icon = Icons.warning_rounded;
    } else if (condition.contains('fog') || condition.contains('mist')) {
      status = 'Caution - Drive with Caution';
      desc =
          'Visibility on the mountain roads is highly reduced. Use fog lights, drive at a low speed, and keep a safe distance from other vehicles.';
      cardBackgroundColor = colorScheme.secondaryContainer;
      textColor = colorScheme.onSecondaryContainer;
      iconColor = colorScheme.secondary;
      icon = Icons.error_rounded;
    } else if (condition.contains('sunny') || condition.contains('clear')) {
      status = 'Highly Recommended';
      desc =
          'Perfect weather for traveling and sightseeing in Galiyat. Great time for trekking in Ayubia National Park or hiking to Mushkpuri Peak!';
      cardBackgroundColor = primaryContainer;
      textColor = primary;
      iconColor = primary;
      icon = Icons.check_circle_rounded;
    } else {
      status = 'Recommended';
      desc =
          'Weather is generally good for travel. However, mountain weather can change quickly, so keep a light jacket and check local advisories.';
      cardBackgroundColor = primaryContainer;
      textColor = primary;
      iconColor = primary;
      icon = Icons.info_rounded;
    }

    return Container(
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: iconColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 32),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Travel Advisory: $status',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              desc,
              style: textTheme.bodyMedium?.copyWith(
                color: textColor.withValues(alpha: 0.9),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyForecastSection(BuildContext context, WeatherModel weather) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final primaryColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final forecast = _getWeeklyForecast(weather);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '7-Day Forecast',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: forecast.map((dayData) {
                final dayName = dayData['day'] as String;
                final temp = dayData['temp'] as double;
                final condition = dayData['condition'] as String;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          dayName,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getMiniWeatherIcon(condition),
                              color: primaryColor,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              condition,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withValues(alpha: 0.8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${temp.toStringAsFixed(0)}°C',
                          textAlign: TextAlign.end,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _getWeeklyForecast(WeatherModel weather) {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final conditions = [
      'Sunny',
      'Cloudy',
      'Rainy',
      'Foggy',
      'Mist',
      'Partly Cloudy'
    ];

    final List<Map<String, dynamic>> forecast = [];
    int seed = weather.temperature.toInt() + weather.condition.length;

    for (int i = 0; i < 7; i++) {
      final dayIndex = (DateTime.now().weekday - 1 + i) % 7;
      final dayName = days[dayIndex];

      double tempVar = ((seed + i * 3) % 5) - 2.0;
      double temp = weather.temperature + tempVar;

      String condition = weather.condition;
      if (i > 0) {
        condition = conditions[(seed + i) % conditions.length];
        if (weather.condition == 'Heavy Rain') {
          condition = (i % 2 == 0) ? 'Rainy' : 'Cloudy';
        } else if (weather.condition == 'Sunny') {
          condition = (i % 3 == 0) ? 'Partly Cloudy' : 'Sunny';
        }
      }

      forecast.add({
        'day': i == 0 ? 'Today' : dayName,
        'temp': temp,
        'condition': condition,
        'humidity': (weather.humidity + (i * 2) % 10 - 5).clamp(40, 100),
      });
    }
    return forecast;
  }

  IconData _getMiniWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'rainy':
      case 'heavy rain':
        return Icons.water_drop_rounded;
      case 'foggy':
      case 'mist':
        return Icons.cloud_rounded;
      case 'cloudy':
      default:
        return Icons.cloud_rounded;
    }
  }

  List<Map<String, dynamic>> _getHourlyForecast(WeatherModel weather) {
    final baseHour = DateTime.now().hour;
    return List.generate(8, (index) {
      final hour = (baseHour + (index * 3)) % 24;
      final temp = weather.temperature + ((index % 3) - 1);
      return {
        'time': '${hour.toString().padLeft(2, '0')}:00',
        'temp': temp,
        'condition': index.isEven ? weather.condition : 'Cloudy',
      };
    });
  }
}
