import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import '../../data/models/region_model.dart';

class RegionSelector extends StatelessWidget {
  final List<RegionModel> regions;
  final RegionModel? selectedRegion;
  final Function(RegionModel) onRegionSelected;
  final bool isDarkBackground;

  const RegionSelector({
    required this.regions,
    required this.selectedRegion,
    required this.onRegionSelected,
    this.isDarkBackground = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.darkSecondary : AppColors.lightSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showRegionSelector(context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isDarkBackground
                ? Colors.white.withValues(alpha: 0.2)
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkBackground
                  ? Colors.white.withValues(alpha: 0.3)
                  : isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: isDarkBackground ? Colors.white70 : secondaryColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                selectedRegion?.name ?? 'Select Region',
                style: GoogleFonts.inter(
                  color: isDarkBackground ? Colors.white : colorScheme.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDarkBackground
                    ? Colors.white70
                    : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRegionSelector(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.darkSecondary : AppColors.lightSecondary;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Select Region',
                  style: GoogleFonts.manrope(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: regions.length,
                  separatorBuilder: (context, index) => Divider(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final region = regions[index];
                    final isSelected = selectedRegion?.id == region.id;
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          onRegionSelected(region);
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(region.imageUrl),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      region.name,
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: isSelected
                                            ? secondaryColor
                                            : colorScheme.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      region.shortDescription,
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: isDark
                                            ? AppColors.darkTextSecondary
                                            : AppColors.lightTextSecondary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              if (isSelected)
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: secondaryColor,
                                  size: 26,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
