import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';

class CorvusCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? customRadius;

  const CorvusCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.color,
    this.customRadius,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? AppColors.surface,
        borderRadius: BorderRadius.circular(customRadius ?? Dimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}
