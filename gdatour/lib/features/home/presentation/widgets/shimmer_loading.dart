import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    final highlightColor = isDark ? Colors.grey.shade600 : Colors.grey.shade100;
    final surfaceColor = isDark ? AppColors.darkSurface : Colors.white;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header placeholders
              Container(
                width: 220,
                height: 24,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 14,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(height: 16),

              // Carousel Banner Placeholder
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(height: 24),

              // Title action grid
              Container(
                width: 120,
                height: 18,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(height: 12),

              // Quick Actions Grid (2x2 lines)
              Row(
                children: [
                  Expanded(child: _buildBox(height: 54, surfaceColor: surfaceColor)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildBox(height: 54, surfaceColor: surfaceColor)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildBox(height: 54, surfaceColor: surfaceColor)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildBox(height: 54, surfaceColor: surfaceColor)),
                ],
              ),
              const SizedBox(height: 24),

              // Weather Card Placeholder
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(24)),
              ),
              const SizedBox(height: 24),

              // Featured Regions Title
              Container(
                width: 160,
                height: 18,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(height: 12),
              
              // Regions Scroll Placeholder
              Row(
                children: [
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox({required double height, required Color surfaceColor}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
