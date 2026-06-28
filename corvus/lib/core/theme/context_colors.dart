import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';

/// Theme-aware color accessor.
/// Use `context.cp.background` instead of hardcoded `AppColors.background`.
extension ThemeColors on BuildContext {
  CpColors get cp => CpColors(this);

  Brightness get _brightness => Theme.of(this).brightness;
}

/// Color palette proxy — returns light or dark colors based on brightness.
class CpColors {
  final BuildContext _context;
  CpColors(this._context);

  Brightness get _b => _context._brightness;

  Color get background => _b == Brightness.light ? AppColors.background : DarkColors.background;
  Color get surface => _b == Brightness.light ? AppColors.surface : DarkColors.surface;
  Color get surfaceVariant => _b == Brightness.light ? AppColors.surfaceVariant : DarkColors.surfaceVariant;
  Color get surfaceElevated => _b == Brightness.light ? AppColors.surfaceElevated : DarkColors.surfaceElevated;

  Color get primary => _b == Brightness.light ? AppColors.primary : DarkColors.primary;
  Color get primaryAlt => _b == Brightness.light ? AppColors.primaryAlt : DarkColors.primaryAlt;
  Color get primaryDim => _b == Brightness.light ? AppColors.primaryDim : DarkColors.primaryDim;
  Color get primarySoft => _b == Brightness.light ? AppColors.primarySoft : DarkColors.primarySoft;

  Color get textPrimary => _b == Brightness.light ? AppColors.textPrimary : DarkColors.textPrimary;
  Color get textSecondary => _b == Brightness.light ? AppColors.textSecondary : DarkColors.textSecondary;
  Color get textTertiary => _b == Brightness.light ? AppColors.textTertiary : DarkColors.textTertiary;
  Color get textOnPrimary => _b == Brightness.light ? AppColors.textOnPrimary : DarkColors.textOnPrimary;
  Color get textOnInverse => _b == Brightness.light ? AppColors.textOnInverse : DarkColors.textOnInverse;

  Color get border => _b == Brightness.light ? AppColors.border : DarkColors.border;
  Color get borderLight => _b == Brightness.light ? AppColors.borderLight : DarkColors.borderLight;
  Color get divider => _b == Brightness.light ? AppColors.divider : DarkColors.divider;

  Color get success => _b == Brightness.light ? AppColors.success : DarkColors.success;
  Color get warning => _b == Brightness.light ? AppColors.warning : DarkColors.warning;
  Color get error => _b == Brightness.light ? AppColors.error : DarkColors.error;
  Color get info => _b == Brightness.light ? AppColors.info : DarkColors.info;

  Color get disabled => _b == Brightness.light ? AppColors.disabled : DarkColors.disabled;
  Color get disabledText => _b == Brightness.light ? AppColors.disabledText : DarkColors.disabledText;
  Color get overlay => _b == Brightness.light ? AppColors.overlay : DarkColors.overlay;
  Color get chatBubbleUser => _b == Brightness.light ? AppColors.chatBubbleUser : DarkColors.chatBubbleUser;
  Color get chatBubbleAI => _b == Brightness.light ? AppColors.chatBubbleAI : DarkColors.chatBubbleAI;
  Color get shimmerBase => _b == Brightness.light ? AppColors.shimmerBase : DarkColors.shimmerBase;
  Color get shimmerHighlight => _b == Brightness.light ? AppColors.shimmerHighlight : DarkColors.shimmerHighlight;
}
