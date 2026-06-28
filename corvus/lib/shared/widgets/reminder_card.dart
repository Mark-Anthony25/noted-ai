import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/models/reminder.dart';
import 'package:intl/intl.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final VoidCallback? onTap;
  final VoidCallback? onToggle;

  const ReminderCard({
    super.key,
    required this.reminder,
    this.onTap,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        border: Border.all(
          color: reminder.isCompleted ? AppColors.success.withValues(alpha: 0.3) : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: reminder.isCompleted ? AppColors.success : Colors.transparent,
                border: Border.all(
                  color: reminder.isCompleted ? AppColors.success : AppColors.textTertiary,
                  width: 1.5,
                ),
              ),
              child: reminder.isCompleted
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder.title,
                  style: AppTextStyles.titleMedium.copyWith(
                    decoration: reminder.isCompleted ? TextDecoration.lineThrough : null,
                    color: reminder.isCompleted ? AppColors.textTertiary : AppColors.textPrimary,
                  ),
                ),
                if (reminder.description != null) ...[
                  const SizedBox(height: Spacing.xxs),
                  Text(
                    reminder.description!,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('h:mm a').format(reminder.dueDate),
                style: AppTextStyles.labelMedium.copyWith(
                  color: _priorityColor,
                ),
              ),
              const SizedBox(height: Spacing.xxs),
              _priorityDot,
            ],
          ),
        ],
      ),
    );
  }

  Color get _priorityColor {
    switch (reminder.priority) {
      case ReminderPriority.high:
        return AppColors.error;
      case ReminderPriority.medium:
        return AppColors.warning;
      case ReminderPriority.low:
        return AppColors.textTertiary;
    }
  }

  Widget get _priorityDot {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: _priorityColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
