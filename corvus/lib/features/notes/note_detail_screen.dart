import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class NoteDetailScreen extends StatelessWidget {
  final String noteId;

  const NoteDetailScreen({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    final note = PlaceholderData.notes.firstWhere(
      (n) => n.id == noteId,
      orElse: () => PlaceholderData.notes.first,
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
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.pin, size: 20),
            color: note.isPinned ? AppColors.primary : AppColors.textSecondary,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(LucideIcons.moreHorizontal, size: 20),
            color: AppColors.textSecondary,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: AppTextStyles.displaySmall,
            ),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Text(
                  DateFormat('MMM d, yyyy - h:mm a').format(note.updatedAt),
                  style: AppTextStyles.labelSmall,
                ),
                const Spacer(),
                if (note.tags.isNotEmpty)
                  ...note.tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.xs),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.sm,
                        vertical: Spacing.xxs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                      ),
                      child: Text(
                        '#$tag',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  )),
              ],
            ),
            const SizedBox(height: Spacing.xxxl),
            Text(
              note.content,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
