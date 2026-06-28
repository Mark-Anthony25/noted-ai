import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CorvusSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final bool enabled;
  final bool autofocus;

  const CorvusSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.hintText = 'Search notes, memories, reminders...',
    this.enabled = true,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.inputHeight,
      decoration: BoxDecoration(
        color: context.cp.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        enabled: enabled,
        autofocus: autofocus,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Icon(LucideIcons.search, size: 18, color: context.cp.textTertiary),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.md),
        ),
      ),
    );
  }
}
