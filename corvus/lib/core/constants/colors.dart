import 'package:flutter/material.dart';

/// Light mode color palette.
abstract class AppColors {
  AppColors._();

  // Canvas & Surfaces — warm paper
  static const Color background = Color(0xFFFAF8F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF2EFE9);
  static const Color surfaceElevated = Color(0xFFFFFFFF);

  // Primary — deep teal (single chromatic accent)
  static const Color primary = Color(0xFF016A71);
  static const Color primaryAlt = Color(0xFF0C4F54);
  static const Color primaryDim = Color(0xFF0F3639);
  static const Color primarySoft = Color(0xFFE3EEEE);

  // Text — warm charcoal ink
  static const Color textPrimary = Color(0xFF27251E);
  static const Color textSecondary = Color(0xFF6B6962);
  static const Color textTertiary = Color(0xFF9B988F);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnInverse = Color(0xFFFDFBFA);

  // Borders — warm, receded
  static const Color border = Color(0xFFE8E3DA);
  static const Color borderLight = Color(0xFFF2EFE9);
  static const Color divider = Color(0xFFE8E3DA);

  // Semantic
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFD97706);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF2563EB);

  // Misc
  static const Color disabled = Color(0xFFE8E3DA);
  static const Color disabledText = Color(0xFF9B988F);
  static const Color overlay = Color(0x4027251E);
  static const Color chatBubbleUser = Color(0xFFE3EEEE);
  static const Color chatBubbleAI = Color(0xFFFFFFFF);
  static const Color shimmerBase = Color(0xFFF2EFE9);
  static const Color shimmerHighlight = Color(0xFFE8E3DA);
}

/// Dark mode color palette — Perplexity-inspired: deep, warm-leaning dark
/// with teal accents that retain legibility and calm.
abstract class DarkColors {
  DarkColors._();

  // Canvas & Surfaces — deep, slightly warm
  static const Color background = Color(0xFF0C0C0D);
  static const Color surface = Color(0xFF18181A);
  static const Color surfaceVariant = Color(0xFF222226);
  static const Color surfaceElevated = Color(0xFF242428);

  // Primary — brighter teal for visibility on dark canvas
  static const Color primary = Color(0xFF2D9BA0);
  static const Color primaryAlt = Color(0xFF1A7A7E);
  static const Color primaryDim = Color(0xFF14575A);
  static const Color primarySoft = Color(0xFF1A3A3C);

  // Text — warm off-white with clear hierarchy
  static const Color textPrimary = Color(0xFFEDEDED);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color textTertiary = Color(0xFF5C5C5C);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnInverse = Color(0xFF0C0C0D);

  // Borders — subtle, receded
  static const Color border = Color(0xFF2A2A2E);
  static const Color borderLight = Color(0xFF222226);
  static const Color divider = Color(0xFF2A2A2E);

  // Semantic — slightly desaturated for dark canvas
  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFF87171);
  static const Color info = Color(0xFF60A5FA);

  // Misc
  static const Color disabled = Color(0xFF2A2A2E);
  static const Color disabledText = Color(0xFF5C5C5C);
  static const Color overlay = Color(0x80000000);
  static const Color chatBubbleUser = Color(0xFF1A3A3C);
  static const Color chatBubbleAI = Color(0xFF18181A);
  static const Color shimmerBase = Color(0xFF222226);
  static const Color shimmerHighlight = Color(0xFF2A2A2E);
}
