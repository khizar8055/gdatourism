import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import '../../data/models/quick_action_model.dart';

class QuickActionCard extends StatelessWidget {
  final QuickActionModel action;
  final VoidCallback onTap;

  const QuickActionCard({
    required this.action,
    required this.onTap,
    super.key,
  });

  IconData _getIconData(String key) {
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
      case 'map':
        return const Color(0xFF66BB6A);
      case 'weather':
        return const Color(0xFF0284C7);
      case 'emergency':
        return const Color(0xFFDC2626);
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = _getIconColor(action.iconKey);
    final iconData = _getIconData(action.iconKey);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: iconColor,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  action.title,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.outline,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
