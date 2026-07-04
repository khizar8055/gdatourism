import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        primaryColor: AppColors.lightPrimary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightPrimary,
          onPrimary: AppColors.lightTextOnPrimary,
          primaryContainer: AppColors.lightPrimaryContainer,
          onPrimaryContainer: AppColors.lightPrimary,
          secondary: AppColors.lightSecondary,
          onSecondary: AppColors.lightTextOnSecondary,
          secondaryContainer: AppColors.lightSecondaryContainer,
          surface: AppColors.lightSurface,
          onSurface: AppColors.lightTextPrimary,
          surfaceContainerHighest: AppColors.lightBackground,
          surfaceContainer: AppColors.lightSurfaceVariant,
          error: AppColors.lightError,
          onError: AppColors.lightTextOnPrimary,
          outline: AppColors.lightBorder,
          shadow: AppColors.lightShadow,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightAppBar,
          foregroundColor: AppColors.lightTextOnPrimary,
          elevation: 0,
          centerTitle: false,
          scrolledUnderElevation: 2,
        ),
        cardTheme: CardThemeData(
          color: AppColors.lightCard,
          elevation: 0,
          surfaceTintColor: AppColors.lightPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.lightCardBorder, width: 1),
          ),
        ),
        dividerColor: AppColors.lightDivider,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.lightBottomNav,
          selectedItemColor: AppColors.lightBottomNavActive,
          unselectedItemColor: AppColors.lightBottomNavInactive,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.lightBottomNav,
          indicatorColor: AppColors.lightPrimaryContainer,
          surfaceTintColor: AppColors.lightPrimary,
          elevation: 8,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.lightPrimary,
                );
              }
              return GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: AppColors.lightBottomNavInactive,
              );
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: AppColors.lightPrimary,
                  size: 26,
                );
              }
              return const IconThemeData(
                color: AppColors.lightBottomNavInactive,
                size: 24,
              );
            },
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightInputFill,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightInputBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightInputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightInputFocused, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightError, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.lightTextHint),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: AppColors.lightTextPrimary, height: 1.5),
            bodyMedium: TextStyle(color: AppColors.lightTextSecondary, height: 1.5),
            bodySmall: TextStyle(color: AppColors.lightTextHint, height: 1.5),
            titleLarge: TextStyle(color: AppColors.lightTextPrimary, fontWeight: FontWeight.w800, height: 1.2),
            titleMedium: TextStyle(color: AppColors.lightTextPrimary, fontWeight: FontWeight.w700, height: 1.3),
            titleSmall: TextStyle(color: AppColors.lightTextPrimary, fontWeight: FontWeight.w600, height: 1.4),
            labelLarge: TextStyle(color: AppColors.lightTextOnPrimary, fontWeight: FontWeight.w600),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightPrimary,
            foregroundColor: AppColors.lightTextOnPrimary,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.lightPrimary,
            side: const BorderSide(color: AppColors.lightPrimary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.lightPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.lightSurfaceVariant,
          selectedColor: AppColors.lightPrimaryContainer,
          checkmarkColor: AppColors.lightPrimary,
          deleteIconColor: AppColors.lightIconMuted,
          labelStyle: GoogleFonts.inter(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w500,
          ),
          secondaryLabelStyle: GoogleFonts.inter(
            color: AppColors.lightPrimary,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.lightBorder, width: 0.5),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
          shape: CircleBorder(),
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: AppColors.lightSurface,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.lightSurface,
          contentTextStyle: GoogleFonts.inter(
            color: AppColors.lightTextPrimary,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        dialogTheme: DialogThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        primaryColor: AppColors.darkPrimary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,
          onPrimary: AppColors.darkTextOnPrimary,
          primaryContainer: AppColors.darkPrimaryContainer,
          onPrimaryContainer: AppColors.darkPrimary,
          secondary: AppColors.darkSecondary,
          onSecondary: AppColors.darkTextOnSecondary,
          secondaryContainer: AppColors.darkSecondaryContainer,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkTextPrimary,
          surfaceContainerHighest: AppColors.darkBackground,
          surfaceContainer: AppColors.darkSurfaceVariant,
          error: AppColors.darkError,
          onError: AppColors.darkTextOnPrimary,
          outline: AppColors.darkBorder,
          shadow: AppColors.darkShadow,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkAppBar,
          foregroundColor: AppColors.darkTextPrimary,
          elevation: 0,
          centerTitle: false,
          scrolledUnderElevation: 2,
        ),
        cardTheme: CardThemeData(
          color: AppColors.darkCard,
          elevation: 0,
          surfaceTintColor: AppColors.darkPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.darkCardBorder, width: 1),
          ),
        ),
        dividerColor: AppColors.darkDivider,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBottomNav,
          selectedItemColor: AppColors.darkBottomNavActive,
          unselectedItemColor: AppColors.darkBottomNavInactive,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.darkBottomNav,
          indicatorColor: AppColors.darkPrimaryContainer,
          surfaceTintColor: AppColors.darkPrimary,
          elevation: 8,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.darkPrimary,
                );
              }
              return GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: AppColors.darkBottomNavInactive,
              );
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: AppColors.darkPrimary,
                  size: 26,
                );
              }
              return const IconThemeData(
                color: AppColors.darkBottomNavInactive,
                size: 24,
              );
            },
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkInputFill,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkInputBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkInputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkInputFocused, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkError, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.darkTextHint),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: AppColors.darkTextPrimary, height: 1.5),
            bodyMedium: TextStyle(color: AppColors.darkTextSecondary, height: 1.5),
            bodySmall: TextStyle(color: AppColors.darkTextHint, height: 1.5),
            titleLarge: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w800, height: 1.2),
            titleMedium: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w700, height: 1.3),
            titleSmall: TextStyle(color: AppColors.darkTextPrimary, fontWeight: FontWeight.w600, height: 1.4),
            labelLarge: TextStyle(color: AppColors.darkTextOnPrimary, fontWeight: FontWeight.w600),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimary,
            foregroundColor: AppColors.darkTextOnPrimary,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.darkPrimary,
            side: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.darkPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            textStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.darkSurfaceVariant,
          selectedColor: AppColors.darkPrimaryContainer,
          checkmarkColor: AppColors.darkPrimary,
          deleteIconColor: AppColors.darkIconMuted,
          labelStyle: GoogleFonts.inter(
            color: AppColors.darkTextPrimary,
            fontWeight: FontWeight.w500,
          ),
          secondaryLabelStyle: GoogleFonts.inter(
            color: AppColors.darkPrimary,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.darkBorder, width: 0.5),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
          shape: CircleBorder(),
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: AppColors.darkSurface,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.darkSurface,
          contentTextStyle: GoogleFonts.inter(
            color: AppColors.darkTextPrimary,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        dialogTheme: DialogThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      );
}
