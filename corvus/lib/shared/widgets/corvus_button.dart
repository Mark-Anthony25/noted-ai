import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';


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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        child: _buildButton(isDisabled),
      ),
    );
  }

  Widget _buildButton(bool isDisabled) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimaryButton(isDisabled);
      case ButtonVariant.secondary:
        return _buildSecondaryButton(isDisabled);
      case ButtonVariant.ghost:
        return _buildGhostButton(isDisabled);
      case ButtonVariant.outline:
        return _buildOutlineButton(isDisabled);
      case ButtonVariant.danger:
        return _buildDangerButton(isDisabled);
    }
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.textOnPrimary,
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

  Widget _buildPrimaryButton(bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? AppColors.disabled : AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildSecondaryButton(bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.surfaceVariant,
        foregroundColor: AppColors.textPrimary,
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildGhostButton(bool isDisabled) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: isDisabled ? AppColors.disabledText : AppColors.textSecondary,
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.sm,
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildOutlineButton(bool isDisabled) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDisabled ? AppColors.disabledText : AppColors.textPrimary,
        side: BorderSide(
          color: isDisabled ? AppColors.disabled : AppColors.borderLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildDangerButton(bool isDisabled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? AppColors.disabled : AppColors.error,
        foregroundColor: AppColors.textOnPrimary,
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.disabledText,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
      child: _buildContent(),
    );
  }
}
