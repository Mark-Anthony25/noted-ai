import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';

import 'package:corvus/core/constants/spacing.dart';

class CorvusTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isMultiline;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const CorvusTextField({
    super.key,
    required this.label,
    this.hintText,
    this.errorText,
    this.helperText,
    this.controller,
    this.isPassword = false,
    this.isMultiline = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: Spacing.sm),
        TextField(
          controller: controller,
          obscureText: isPassword,
          maxLines: isMultiline ? 5 : 1,
          keyboardType: keyboardType,
          onChanged: onChanged,
          focusNode: focusNode,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: suffixIcon,
                  )
                : null,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: Spacing.xs),
            child: Text(
              errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.error,
                  ),
            ),
          ),
        if (helperText != null && errorText == null)
          Padding(
            padding: const EdgeInsets.only(top: Spacing.xs),
            child: Text(
              helperText!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
