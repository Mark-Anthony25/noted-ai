import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';

class QuickActionRow extends StatelessWidget {
  final VoidCallback? onNewNote;
  final VoidCallback? onRemindMe;
  final VoidCallback? onChat;

  const QuickActionRow({
    super.key,
    this.onNewNote,
    this.onRemindMe,
    this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuickAction(
          icon: LucideIcons.plus,
          label: 'New note',
          onTap: onNewNote,
        ),
        const SizedBox(width: Spacing.sm),
        _QuickAction(
          icon: LucideIcons.bellPlus,
          label: 'Remind me',
          onTap: onRemindMe,
        ),
        const SizedBox(width: Spacing.sm),
        _QuickAction(
          icon: LucideIcons.messageCircle,
          label: 'Chat',
          onTap: onChat,
          isPrimary: true,
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isPrimary;

  const _QuickAction({
    required this.icon,
    required this.label,
    this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
          decoration: BoxDecoration(
            color: isPrimary ? context.cp.primary.withValues(alpha: 0.08) : context.cp.surface,
            borderRadius: BorderRadius.circular(Dimensions.radiusSm),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20, color: isPrimary ? context.cp.primary : context.cp.textSecondary),
              const SizedBox(height: Spacing.sm),
              Text(label, style: AppTextStyles.labelMedium.copyWith(
                color: isPrimary ? context.cp.primary : context.cp.textSecondary,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
