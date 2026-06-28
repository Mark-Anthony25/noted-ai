import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';

class QuickActionRow extends StatelessWidget {
  final VoidCallback? onNewNote;
  final VoidCallback? onRemindMe;
  final VoidCallback? onSearch;
  final VoidCallback? onChat;

  const QuickActionRow({
    super.key,
    this.onNewNote,
    this.onRemindMe,
    this.onSearch,
    this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _QuickAction(
            icon: LucideIcons.filePlus,
            label: 'New Note',
            color: AppColors.primary,
            onTap: onNewNote,
          ),
          _QuickAction(
            icon: LucideIcons.bellPlus,
            label: 'Remind Me',
            color: AppColors.primaryAlt,
            onTap: onRemindMe,
          ),
          _QuickAction(
            icon: LucideIcons.search,
            label: 'Search',
            color: AppColors.success,
            onTap: onSearch,
          ),
          _QuickAction(
            icon: LucideIcons.messageCircle,
            label: 'Chat',
            color: AppColors.info,
            onTap: onChat,
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(Dimensions.radiusLg),
            ),
            child: Icon(icon, size: 22, color: color),
          ),
          const SizedBox(height: Spacing.xs),
          Text(label, style: AppTextStyles.labelMedium),
        ],
      ),
    );
  }
}
