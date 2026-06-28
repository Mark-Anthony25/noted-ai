import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';

enum ButtonVariant { primary, secondary, ghost, outline, danger }

class CorvusButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? height;

  const CorvusButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leadingIcon,
    this.trailingIcon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height ?? Dimensions.buttonMd,
      child: _buildButton(context, isDisabled),
    );
  }

  Widget _buildButton(BuildContext context, bool isDisabled) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimaryButton(context, isDisabled);
      case ButtonVariant.secondary:
        return _buildSecondaryButton(context, isDisabled);
      case ButtonVariant.ghost:
        return _buildGhostButton(context, isDisabled);
      case ButtonVariant.outline:
        return _buildOutlineButton(context, isDisabled);
      case ButtonVariant.danger:
        return _buildDangerButton(context, isDisabled);
    }
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.cp.textOnPrimary,
            ),
          )
        else ...[
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 18),
            const SizedBox(width: Spacing.sm),
          ],
          Text(label),
          if (trailingIcon != null) ...[
            const SizedBox(width: Spacing.sm),
            Icon(trailingIcon, size: 18),
          ],
        ],
      ],
    );
  }

  Widget _buildPrimaryButton(BuildContext context, bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? context.cp.disabled : context.cp.primary,
        foregroundColor: context.cp.textOnPrimary,
        disabledBackgroundColor: context.cp.disabled,
        disabledForegroundColor: context.cp.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.cp.surfaceVariant,
        foregroundColor: context.cp.textPrimary,
        disabledBackgroundColor: context.cp.disabled,
        disabledForegroundColor: context.cp.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildGhostButton(BuildContext context, bool isDisabled) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: isDisabled ? context.cp.disabledText : context.cp.textSecondary,
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.sm,
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildOutlineButton(BuildContext context, bool isDisabled) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDisabled ? context.cp.disabledText : context.cp.textPrimary,
        side: BorderSide(
          color: isDisabled ? context.cp.disabled : context.cp.borderLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildDangerButton(BuildContext context, bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? context.cp.disabled : context.cp.error,
        foregroundColor: context.cp.textOnPrimary,
        disabledBackgroundColor: context.cp.disabled,
        disabledForegroundColor: context.cp.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(context),
    );
  }
}
