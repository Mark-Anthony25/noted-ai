import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
      padding: const EdgeInsets.fromLTRB(Spacing.md, Spacing.lg, Spacing.lg, Spacing.lg),
      decoration: BoxDecoration(
        color: context.cp.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: reminder.isCompleted ? context.cp.success : Colors.transparent,
                border: Border.all(
                  color: reminder.isCompleted ? context.cp.success : context.cp.textTertiary,
                  width: 1.5,
                ),
              ),
              child: reminder.isCompleted
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
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
                    color: reminder.isCompleted ? context.cp.textTertiary : context.cp.textPrimary,
                  ),
                ),
                if (reminder.description != null) ...[
                  const SizedBox(height: Spacing.xxs),
                  Text(reminder.description!, style: AppTextStyles.bodyMedium.copyWith(color: context.cp.textSecondary)),
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
                style: AppTextStyles.labelSmall.copyWith(color: _priorityColor(context)),
              ),
              const SizedBox(height: Spacing.xxs),
              Container(width: 5, height: 5, decoration: BoxDecoration(color: _priorityColor(context), shape: BoxShape.circle)),
            ],
          ),
        ],
      ),
    );
  }

  Color _priorityColor(BuildContext context) {
    switch (reminder.priority) {
      case ReminderPriority.high:
        return context.cp.error;
      case ReminderPriority.medium:
        return context.cp.warning;
      case ReminderPriority.low:
        return context.cp.textTertiary;
    }
  }
}
