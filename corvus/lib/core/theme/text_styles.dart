import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:corvus/core/constants/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _inter => GoogleFonts.inter(letterSpacing: -0.01);

  // ── Base styles (no color — applied via textTheme factory) ──────────────

  static TextStyle get displayLarge => _inter.copyWith(fontSize: 36, fontWeight: FontWeight.w600, height: 1.15);

  static TextStyle get displayMedium => _inter.copyWith(fontSize: 30, fontWeight: FontWeight.w600, height: 1.2);

  static TextStyle get displaySmall => _inter.copyWith(fontSize: 26, fontWeight: FontWeight.w600, height: 1.25);

  static TextStyle get headlineLarge => _inter.copyWith(fontSize: 22, fontWeight: FontWeight.w600, height: 1.3);

  static TextStyle get headlineMedium => _inter.copyWith(fontSize: 18, fontWeight: FontWeight.w600, height: 1.35);

  static TextStyle get headlineSmall => _inter.copyWith(fontSize: 17, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get titleLarge => _inter.copyWith(fontSize: 15, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get titleMedium => _inter.copyWith(fontSize: 14, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get titleSmall => _inter.copyWith(fontSize: 13, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get bodyLarge => _inter.copyWith(fontSize: 15, fontWeight: FontWeight.w400, height: 1.65);

  static TextStyle get bodyMedium => _inter.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6);

  static TextStyle get bodySmall => _inter.copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle get labelLarge => _inter.copyWith(fontSize: 13, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get labelMedium => _inter.copyWith(fontSize: 12, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get labelSmall => _inter.copyWith(fontSize: 11, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle get button => _inter.copyWith(fontSize: 14, fontWeight: FontWeight.w500, height: 1.4, letterSpacing: 0.2);

  static TextStyle get buttonSmall => _inter.copyWith(fontSize: 12, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle get caption => _inter.copyWith(fontSize: 11, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle get chatMessage => _inter.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6);

  static TextStyle get chatTime => _inter.copyWith(fontSize: 11, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle get timeAgo => _inter.copyWith(fontSize: 11, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle get amount => _inter.copyWith(fontSize: 22, fontWeight: FontWeight.w600, height: 1.2);

  // ── Factory: create a TextTheme from a brightness-aware palette ──────────

  static TextTheme textTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final Color primary = isLight ? AppColors.textPrimary : DarkColors.textPrimary;
    final Color secondary = isLight ? AppColors.textSecondary : DarkColors.textSecondary;
    final Color tertiary = isLight ? AppColors.textTertiary : DarkColors.textTertiary;

    return TextTheme(
      displayLarge: displayLarge.copyWith(color: primary),
      displayMedium: displayMedium.copyWith(color: primary),
      displaySmall: displaySmall.copyWith(color: primary),
      headlineLarge: headlineLarge.copyWith(color: primary),
      headlineMedium: headlineMedium.copyWith(color: primary),
      headlineSmall: headlineSmall.copyWith(color: primary),
      titleLarge: titleLarge.copyWith(color: primary),
      titleMedium: titleMedium.copyWith(color: primary),
      titleSmall: titleSmall.copyWith(color: primary),
      bodyLarge: bodyLarge.copyWith(color: primary),
      bodyMedium: bodyMedium.copyWith(color: secondary),
      bodySmall: bodySmall.copyWith(color: tertiary),
      labelLarge: labelLarge.copyWith(color: primary),
      labelMedium: labelMedium.copyWith(color: secondary),
      labelSmall: labelSmall.copyWith(color: tertiary),
    );
  }
}
