import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ---------------- LIGHT THEME ----------------
  static const Color lightBackground        = Color(0xFFFAF7F0); // warm ivory, not stark white
  static const Color lightSurface           = Color(0xFFFFFFFF); // cards, sheets
  static const Color lightSurfaceVariant    = Color(0xFFF2EEE3); // chips, input bg, secondary surface

  static const Color lightPrimary           = Color(0xFF1B4D3E); // deep pine green
  static const Color lightPrimaryContainer  = Color(0xFFE3EFE9); // light green tint (selected states)
  static const Color lightSecondary         = Color(0xFFC9A84C); // warm gold accent
  static const Color lightSecondaryContainer= Color(0xFFF5EBD1); // light gold tint
  static const Color lightTertiaryInfo      = Color(0xFF2A6F97); // misty blue (info/links alt)

  static const Color lightAppBar            = Color(0xFF1B4D3E); // same green both modes = brand anchor
  static const Color lightBottomNav         = Color(0xFFFFFFFF);
  static const Color lightBottomNavActive   = Color(0xFF1B4D3E);
  static const Color lightBottomNavInactive = Color(0xFF9A9A9A);

  static const Color lightCard              = Color(0xFFFFFFFF);
  static const Color lightCardBorder        = Color(0xFFE8E3D8);
  static const Color lightBorder            = Color(0xFFDDD6C7); // general/input border
  static const Color lightDivider           = Color(0xFFEDE8DC);

  static const Color lightTextPrimary       = Color(0xFF1F2921); // near-black, green-tinted
  static const Color lightTextSecondary     = Color(0xFF5F6B63); // medium/muted text
  static const Color lightTextHint          = Color(0xFFA4A79C); // disabled/placeholder
  static const Color lightTextOnPrimary     = Color(0xFFFFFFFF); // text on green buttons/appbar
  static const Color lightTextOnSecondary   = Color(0xFF23200F); // text on gold buttons

  static const Color lightIconPrimary       = Color(0xFF1B4D3E);
  static const Color lightIconMuted         = Color(0xFF7C8579);

  static const Color lightSuccess           = Color(0xFF2E7D32);
  static const Color lightWarning           = Color(0xFFF9A825);
  static const Color lightError             = Color(0xFFC62828);
  static const Color lightInfo              = Color(0xFF2A6F97);

  static const Color lightShadow            = Color(0x141B4D3E); // 8% green-tinted shadow
  static const Color lightScrim             = Color(0x66000000); // 40% overlay
  static const Color lightRipple            = Color(0x26C9A84C); // 15% gold ripple

  static const Color lightInputFill         = Color(0xFFFFFFFF);
  static const Color lightInputBorder       = Color(0xFFDDD6C7);
  static const Color lightInputFocused      = Color(0xFF1B4D3E);
  static const Color lightChipBg            = Color(0xFFF0EDE2);
  static const Color lightChipText          = Color(0xFF3A3F38);
  static const Color lightLink              = Color(0xFF1B4D3E);

  // ---------------- DARK THEME ----------------
  static const Color darkBackground         = Color(0xFF12160F); // deep forest-charcoal, not pure black
  static const Color darkSurface            = Color(0xFF1B211A); // cards, sheets (elevated)
  static const Color darkSurfaceVariant     = Color(0xFF232A20); // chips, input bg

  static const Color darkPrimary            = Color(0xFF6FBF97); // lighter pine green (contrast on dark)
  static const Color darkPrimaryContainer   = Color(0xFF24352B);
  static const Color darkSecondary          = Color(0xFFE0C878); // brighter gold for dark bg contrast
  static const Color darkSecondaryContainer = Color(0xFF39331C);
  static const Color darkTertiaryInfo       = Color(0xFF64B5F6);

  static const Color darkAppBar             = Color(0xFF14261D); // darker pine, brand-consistent
  static const Color darkBottomNav          = Color(0xFF1B211A);
  static const Color darkBottomNavActive    = Color(0xFF6FBF97);
  static const Color darkBottomNavInactive  = Color(0xFF7A8079);

  static const Color darkCard               = Color(0xFF1B211A);
  static const Color darkCardBorder         = Color(0xFF2C352A);
  static const Color darkBorder             = Color(0xFF2C352A);
  static const Color darkDivider            = Color(0xFF262E22);

  static const Color darkTextPrimary        = Color(0xFFF2F0E9); // warm off-white, not pure white
  static const Color darkTextSecondary      = Color(0xFFA8AFA2); // medium/muted text
  static const Color darkTextHint           = Color(0xFF6B7268);
  static const Color darkTextOnPrimary      = Color(0xFF0D1B12); // dark text on light-green buttons
  static const Color darkTextOnSecondary    = Color(0xFF2A2410); // dark text on gold buttons

  static const Color darkIconPrimary        = Color(0xFF6FBF97);
  static const Color darkIconMuted          = Color(0xFF7C8579);

  static const Color darkSuccess            = Color(0xFF66BB6A);
  static const Color darkWarning            = Color(0xFFFFCA28);
  static const Color darkError              = Color(0xFFEF5350);
  static const Color darkInfo               = Color(0xFF64B5F6);

  static const Color darkShadow             = Color(0x80000000); // 50% shadow
  static const Color darkScrim              = Color(0x99000000); // 60% overlay
  static const Color darkRipple             = Color(0x1FE0C878); // 12% gold ripple

  static const Color darkInputFill          = Color(0xFF1B211A);
  static const Color darkInputBorder        = Color(0xFF2C352A);
  static const Color darkInputFocused       = Color(0xFF6FBF97);
  static const Color darkChipBg             = Color(0xFF232A20);
  static const Color darkChipText           = Color(0xFFC9CFC4);
  static const Color darkLink               = Color(0xFFE0C878);
}
