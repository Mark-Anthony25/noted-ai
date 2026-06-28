import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/models/note.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
          color: context.cp.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusSm),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(note.title, style: AppTextStyles.titleMedium.copyWith(color: context.cp.textPrimary),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      if (note.isPinned)
                        Padding(
                          padding: const EdgeInsets.only(left: Spacing.xs),
                          child: Icon(LucideIcons.pin, size: 12, color: context.cp.primary),
                        ),
                    ],
                  ),
                  const SizedBox(height: Spacing.xxs),
                  Text(note.content, style: AppTextStyles.bodySmall.copyWith(color: context.cp.textTertiary),
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: Spacing.sm),
                  Row(
                    children: [
                      Text(DateFormat('MMM d, h:mm a').format(note.updatedAt),
                          style: AppTextStyles.caption.copyWith(color: context.cp.textTertiary)),
                      const SizedBox(width: Spacing.sm),
                      if (note.tags.isNotEmpty)
                        Expanded(
                          child: Text(
                            note.tags.map((t) => '#$t').join(' '),
                            style: AppTextStyles.caption.copyWith(color: context.cp.primary),
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
