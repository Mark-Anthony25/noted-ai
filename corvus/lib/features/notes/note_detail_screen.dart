import 'package:flutter/material.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.cp.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.pin, size: 20),
            color: note.isPinned ? context.cp.primary : context.cp.textSecondary,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(LucideIcons.moreHorizontal, size: 20),
            color: context.cp.textSecondary,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: AppTextStyles.displaySmall),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Icon(LucideIcons.clock, size: 12, color: context.cp.textTertiary),
                const SizedBox(width: Spacing.xs),
                Text(
                  '${note.updatedAt.month}/${note.updatedAt.day}/${note.updatedAt.year}',
                  style: AppTextStyles.caption,
                ),
                const Spacer(),
                if (note.tags.isNotEmpty)
                  ...note.tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.xs),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xxs),
                      decoration: BoxDecoration(
                        color: context.cp.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                      ),
                      child: Text(
                        '#$tag',
                        style: AppTextStyles.labelSmall.copyWith(color: context.cp.primary),
                      ),
                    ),
                  )),
              ],
            ),
            const SizedBox(height: Spacing.xxxl),
            Text(
              note.content,
              style: AppTextStyles.bodyLarge.copyWith(
                color: context.cp.textPrimary,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
