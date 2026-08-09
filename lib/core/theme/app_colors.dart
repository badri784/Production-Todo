import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF234A27);
  static const Color primaryDark = Color(0xFF18351B);
  static const Color primaryLight = Color(0xFF386A3D);

  // Secondary & Backgrounds
  static const Color background = Color(0xFFF8F9F8); // خلفية الشاشات
  static const Color surface = Color(
    0xFFFFFFFF,
  ); // خلفية الـ Cards والـ Input Fields
  static const Color secondaryBackground = Color(0xFFF3F3F2);

  // Accent / Tertiary (Gold / Mustard)
  static const Color accent = Color(0xFFDDAF37);
  static const Color accentLight = Color(0xFFF4E3B4);

  // Text Colors
  static const Color textPrimary = Color(0xFF1B1B1B);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textHint = Color(0xFFA0A5AA);

  // Borders & Dividers
  static const Color border = Color(0xFFE2E4E2);

  // Status Colors
  static const Color success = Color(0xFF28A745);
  static const Color error = Color(0xFFDC3545);
}
