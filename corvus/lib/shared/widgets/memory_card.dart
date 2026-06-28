import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/models/memory.dart';
import 'package:intl/intl.dart';

class MemoryCard extends StatelessWidget {
  final Memory memory;
  final VoidCallback? onTap;

  const MemoryCard({
    super.key,
    required this.memory,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.sm,
                    vertical: Spacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAlt.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                  ),
                  child: Text(
                    memory.category,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primaryAlt,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('MMM d').format(memory.timestamp),
                  style: AppTextStyles.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              memory.title,
              style: AppTextStyles.titleMedium,
            ),
            const SizedBox(height: Spacing.xs),
            Text(
              memory.snippet,
              style: AppTextStyles.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (memory.tags.isNotEmpty) ...[
              const SizedBox(height: Spacing.sm),
              Wrap(
                spacing: Spacing.xs,
                runSpacing: Spacing.xs,
                children: memory.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.sm,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                    ),
                    child: Text(
                      '#$tag',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
