import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/theme/context_colors.dart';

class CorvusFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? label;

  const CorvusFab({
    super.key,
    required this.icon,
    this.onPressed,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.cp.primary,
      foregroundColor: context.cp.textOnPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusLg),
      ),
      child: Icon(icon),
    );
  }
}
