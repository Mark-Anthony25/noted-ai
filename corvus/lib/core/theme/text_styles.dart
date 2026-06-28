import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:corvus/core/constants/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _inter => GoogleFonts.inter();

  static TextStyle get displayLarge => _inter.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: AppColors.textPrimary,
      );

  static TextStyle get displayMedium => _inter.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.15,
        color: AppColors.textPrimary,
      );

  static TextStyle get displaySmall => _inter.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineLarge => _inter.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineMedium => _inter.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineSmall => _inter.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.35,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleLarge => _inter.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleMedium => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleSmall => _inter.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => _inter.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyMedium => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textSecondary,
      );

  static TextStyle get bodySmall => _inter.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textTertiary,
      );

  static TextStyle get labelLarge => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  static TextStyle get labelMedium => _inter.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: AppColors.textSecondary,
      );

  static TextStyle get labelSmall => _inter.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: AppColors.textTertiary,
      );

  // Special styles
  static TextStyle get button => _inter.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0.3,
        color: AppColors.textOnPrimary,
      );

  static TextStyle get buttonSmall => _inter.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.textOnPrimary,
      );

  static TextStyle get caption => _inter.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.textTertiary,
      );

  static TextStyle get chatMessage => _inter.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textPrimary,
      );

  static TextStyle get chatTime => _inter.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.textTertiary,
      );

  static TextStyle get timeAgo => _inter.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.textTertiary,
      );

  static TextStyle get amount => _inter.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.textPrimary,
      );
}
