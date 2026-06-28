import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
          color: context.cp.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusSm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xxs),
                  decoration: BoxDecoration(
                    color: context.cp.primaryAlt.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                  ),
                  child: Text(memory.category, style: AppTextStyles.caption.copyWith(color: context.cp.primaryAlt)),
                ),
                const Spacer(),
                Text(DateFormat('MMM d').format(memory.timestamp),
                    style: AppTextStyles.caption.copyWith(color: context.cp.textTertiary)),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            Text(memory.title, style: AppTextStyles.titleMedium.copyWith(color: context.cp.textPrimary)),
            const SizedBox(height: Spacing.xxs),
            Text(memory.snippet, style: AppTextStyles.bodyMedium.copyWith(color: context.cp.textSecondary),
                maxLines: 2, overflow: TextOverflow.ellipsis),
            if (memory.tags.isNotEmpty) ...[
              const SizedBox(height: Spacing.sm),
              Wrap(
                spacing: Spacing.xs,
                runSpacing: Spacing.xs,
                children: memory.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: 2),
                    decoration: BoxDecoration(
                      color: context.cp.background,
                      borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                    ),
                    child: Text('#$tag', style: AppTextStyles.caption.copyWith(color: context.cp.textTertiary)),
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
