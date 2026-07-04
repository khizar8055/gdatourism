import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GdaSliverAppHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showLogo;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget> actions;
  final bool reserveLeadingSpace;

  const GdaSliverAppHeader({
    super.key,
    required this.title,
    this.subtitle = 'Galiyat Development Authority',
    this.showLogo = false,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions = const [],
    this.reserveLeadingSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final hasLeading = showLogo || showBackButton || reserveLeadingSpace;

    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      elevation: 0,
      scrolledUnderElevation: 2,
      backgroundColor: isDark ? AppColors.darkAppBar : AppColors.lightAppBar,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 72,
      titleSpacing: 12,
      leadingWidth: hasLeading ? (showLogo ? 60 : 56) : 0,
      leading: _buildLeading(context),
      title: _HeaderTitle(
        title: title,
        subtitle: subtitle,
      ),
      actions: [
        ...actions,
        if (actions.isNotEmpty) const SizedBox(width: 12),
      ],
    );
  }

  Widget? _buildLeading(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (showLogo) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          height: 36,
          width: 36,
          child: Image.asset(
            'assets/images/gda_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    if (showBackButton) {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
          ),
          onPressed: onBackPressed,
        ),
      );
    }

    if (reserveLeadingSpace) {
      return const SizedBox.shrink();
    }

    return null;
  }
}

class GdaHeaderBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showLogo;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget> actions;

  const GdaHeaderBar({
    super.key,
    required this.title,
    this.subtitle = 'Galiyat Development Authority',
    this.showLogo = false,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkAppBar : AppColors.lightAppBar,
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: SizedBox(
                height: 36,
                width: 36,
                child: Image.asset(
                  'assets/images/gda_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          else if (showBackButton)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: onBackPressed,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                ),
              ),
            )
          else
            const SizedBox(width: 44),
          Expanded(
            child: _HeaderTitle(
              title: title,
              subtitle: subtitle,
            ),
          ),
          if (actions.isNotEmpty) ...actions,
        ],
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _HeaderTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
          ),
        ),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodySmall?.copyWith(
            color: (isDark ? AppColors.darkTextSecondary : AppColors.lightTextOnPrimary)
                .withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
