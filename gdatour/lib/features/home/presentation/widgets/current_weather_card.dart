import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import '../../data/models/weather_model.dart';
import '../../data/models/region_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  final WeatherModel? weather;
  final VoidCallback onViewForecast;
  final RegionModel? selectedRegion;

  const CurrentWeatherCard({
    required this.weather,
    required this.onViewForecast,
    required this.selectedRegion,
    super.key,
  });

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'cloudy':
        return Icons.cloud_rounded;
      case 'heavy rain':
        return Icons.umbrella_rounded;
      case 'foggy':
      case 'mist':
        return Icons.blur_on_rounded;
      case 'partly cloudy':
        return Icons.wb_cloudy_rounded;
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny_rounded;
      default:
        return Icons.cloud_queue_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (weather == null) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline, width: 1),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off_rounded,
                size: 52,
                color: colorScheme.outline,
              ),
              const SizedBox(height: 14),
              Text(
                'Weather details unavailable',
                style: GoogleFonts.inter(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final weatherData = weather!;
    final primaryColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final primaryContainer = isDark ? AppColors.darkPrimaryContainer : AppColors.lightPrimaryContainer;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: primaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withValues(alpha: 0.25), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedRegion?.name ?? 'Select Region',
                style: GoogleFonts.manrope(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Icon(
                _getWeatherIcon(weatherData.condition),
                color: primaryColor,
                size: 48,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            weatherData.condition,
            style: GoogleFonts.inter(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${weatherData.temperature.toStringAsFixed(1)}°',
                style: GoogleFonts.manrope(
                  color: primaryColor,
                  fontSize: 52,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'C',
                  style: GoogleFonts.inter(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Spacer(),
              // Mini details
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.water_drop_outlined,
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${weatherData.humidity.toStringAsFixed(0)}%',
                        style: GoogleFonts.inter(
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.air_rounded,
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${weatherData.windSpeed.toStringAsFixed(1)} km/h',
                        style: GoogleFonts.inter(
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 1,
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hourly updates',
                style: GoogleFonts.inter(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
              ElevatedButton.icon(
                onPressed: onViewForecast,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: isDark ? AppColors.darkTextOnPrimary : AppColors.lightTextOnPrimary,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text('Forecast'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
