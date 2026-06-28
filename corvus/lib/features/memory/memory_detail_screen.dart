import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:intl/intl.dart';

class MemoryDetailScreen extends StatelessWidget {
  final String memoryId;

  const MemoryDetailScreen({super.key, required this.memoryId});

  @override
  Widget build(BuildContext context) {
    final memory = PlaceholderData.memories.firstWhere(
      (m) => m.id == memoryId,
      orElse: () => PlaceholderData.memories.first,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryAlt.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(Dimensions.radiusFull),
              ),
              child: Text(
                memory.category,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primaryAlt,
                ),
              ),
            ),
            const SizedBox(height: Spacing.lg),
            Text(memory.title, style: AppTextStyles.displaySmall),
            const SizedBox(height: Spacing.md),
            Text(
              DateFormat('MMMM d, yyyy').format(memory.timestamp),
              style: AppTextStyles.labelSmall,
            ),
            const SizedBox(height: Spacing.xxxl),
            Text(
              memory.snippet,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                height: 1.8,
              ),
            ),
            if (memory.tags.isNotEmpty) ...[
              const SizedBox(height: Spacing.xxl),
              Wrap(
                spacing: Spacing.sm,
                runSpacing: Spacing.sm,
                children: memory.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.md,
                      vertical: Spacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                    ),
                    child: Text(
                      '#$tag',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.textSecondary,
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
