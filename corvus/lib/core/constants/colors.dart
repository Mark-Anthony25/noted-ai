import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0F1117);
  static const Color surface = Color(0xFF1A1D24);
  static const Color surfaceVariant = Color(0xFF242830);
  static const Color surfaceElevated = Color(0xFF2A2E37);

  // Primary
  static const Color primary = Color(0xFF4F7CFF);
  static const Color primaryAlt = Color(0xFF7C6FF0);
  static const Color primaryDim = Color(0xFF3A5FD9);

  // Text
  static const Color textPrimary = Color(0xFFF1F3F5);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textTertiary = Color(0xFF6B7280);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Borders & Dividers
  static const Color border = Color(0xFF2A2E37);
  static const Color borderLight = Color(0xFF353A45);
  static const Color divider = Color(0xFF1E2128);

  // Semantic
  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFF87171);
  static const Color info = Color(0xFF60A5FA);

  // Misc
  static const Color disabled = Color(0xFF3A3F4A);
  static const Color disabledText = Color(0xFF5A5F6A);
  static const Color overlay = Color(0x80000000);
  static const Color chatBubbleUser = Color(0xFF4F7CFF);
  static const Color chatBubbleAI = Color(0xFF1A1D24);
  static const Color shimmerBase = Color(0xFF1A1D24);
  static const Color shimmerHighlight = Color(0xFF2A2E37);
}
