import 'package:flutter/material.dart';

/// Neutral light mode color palette.
/// No chromatic accent — pure grayscale with warm undertones.
abstract class AppColors {
  AppColors._();

  // Canvas & Surfaces — clean, warm-leaning white
  static const Color background = Color(0xFFF9F9F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F0EE);
  static const Color surfaceElevated = Color(0xFFFFFFFF);

  // Primary — neutral gray (the only "accent" is tone, not hue)
  static const Color primary = Color(0xFF555555);
  static const Color primaryAlt = Color(0xFF777777);
  static const Color primaryDim = Color(0xFF999999);
  static const Color primarySoft = Color(0xFFEEEEEC);

  // Text — warm charcoal
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B69);
  static const Color textTertiary = Color(0xFF9C9C98);
  static const Color textOnPrimary = Color(0xFFF9F9F8);
  static const Color textOnInverse = Color(0xFFF9F9F8);

  // Borders — subtle, neutral
  static const Color border = Color(0xFFE4E4E2);
  static const Color borderLight = Color(0xFFF0F0EE);
  static const Color divider = Color(0xFFE4E4E2);

  // Semantic
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFD97706);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF555555);

  // Misc
  static const Color disabled = Color(0xFFE4E4E2);
  static const Color disabledText = Color(0xFF9C9C98);
  static const Color overlay = Color(0x401A1A1A);
  static const Color chatBubbleUser = Color(0xFFE4E4E2);
  static const Color chatBubbleAI = Color(0xFFFFFFFF);
  static const Color shimmerBase = Color(0xFFF0F0EE);
  static const Color shimmerHighlight = Color(0xFFE4E4E2);
}

/// Neutral dark mode color palette — Claude Code-inspired.
/// Near-black backgrounds, warm off-white text, no chromatic color.
abstract class DarkColors {
  DarkColors._();

  // Canvas & Surfaces — near-black with subtle warmth
  static const Color background = Color(0xFF0E0E0E);
  static const Color surface = Color(0xFF181818);
  static const Color surfaceVariant = Color(0xFF222222);
  static const Color surfaceElevated = Color(0xFF2A2A2A);

  // Primary — neutral gray tones only
  static const Color primary = Color(0xFF8B8B8B);
  static const Color primaryAlt = Color(0xFFAAAAAA);
  static const Color primaryDim = Color(0xFF6B6B6B);
  static const Color primarySoft = Color(0xFF1E1E1E);

  // Text — warm off-white, comfortable contrast
  static const Color textPrimary = Color(0xFFE3E3E0);
  static const Color textSecondary = Color(0xFF9C9C9A);
  static const Color textTertiary = Color(0xFF606060);
  static const Color textOnPrimary = Color(0xFF0E0E0E);
  static const Color textOnInverse = Color(0xFF0E0E0E);

  // Borders — subtle dark gray
  static const Color border = Color(0xFF2C2C2A);
  static const Color borderLight = Color(0xFF222222);
  static const Color divider = Color(0xFF2C2C2A);

  // Semantic
  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFF87171);
  static const Color info = Color(0xFF9C9C9A);

  // Misc
  static const Color disabled = Color(0xFF2C2C2A);
  static const Color disabledText = Color(0xFF555555);
  static const Color overlay = Color(0x80000000);
  static const Color chatBubbleUser = Color(0xFF2A2A2A);
  static const Color chatBubbleAI = Color(0xFF181818);
  static const Color shimmerBase = Color(0xFF1E1E1E);
  static const Color shimmerHighlight = Color(0xFF2C2C2A);
}
