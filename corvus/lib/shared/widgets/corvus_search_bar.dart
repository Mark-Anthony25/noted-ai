import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CorvusSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final bool enabled;

  const CorvusSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.hintText = 'Search notes, memories, reminders...',
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.inputHeight,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        enabled: enabled,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(Spacing.md),
            child: Icon(LucideIcons.search, size: 20, color: AppColors.textTertiary),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.md,
          ),
        ),
      ),
    );
  }
}
