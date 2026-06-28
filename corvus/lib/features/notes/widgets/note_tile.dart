import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/models/note.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const NoteTile({
    super.key,
    required this.note,
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
          border: Border.all(color: note.isPinned ? AppColors.primary.withValues(alpha: 0.3) : AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: note.isPinned ? AppColors.primary : AppColors.primaryAlt,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          note.title,
                          style: AppTextStyles.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (note.isPinned)
                        const Icon(
                          LucideIcons.pin,
                          size: 14,
                          color: AppColors.primary,
                        ),
                    ],
                  ),
                  const SizedBox(height: Spacing.xxs),
                  Text(
                    note.content,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Spacing.sm),
                  Row(
                    children: [
                      Text(
                        DateFormat('MMM d, h:mm a').format(note.updatedAt),
                        style: AppTextStyles.labelSmall,
                      ),
                      const SizedBox(width: Spacing.sm),
                      if (note.tags.isNotEmpty)
                        Expanded(
                          child: Text(
                            note.tags.map((t) => '#$t').join(' · '),
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.primary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
