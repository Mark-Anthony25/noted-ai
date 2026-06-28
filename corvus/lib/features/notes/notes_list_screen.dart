import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/corvus_search_bar.dart';

import 'package:corvus/features/notes/widgets/note_tile.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = PlaceholderData.notes;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.lg, Spacing.lg, Spacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notes', style: AppTextStyles.displaySmall),
                    const SizedBox(height: Spacing.lg),
                    CorvusSearchBar(
                      onTap: () => context.push('/search'),
                      enabled: false,
                      hintText: 'Search notes...',
                    ),
                    const SizedBox(height: Spacing.lg),
                    SizedBox(
                      height: 36,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _filterChip('All', true),
                          _filterChip('Work', false),
                          _filterChip('Personal', false),
                          _filterChip('Reading', false),
                          _filterChip('Travel', false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final note = notes[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: Spacing.lg,
                      right: Spacing.lg,
                      bottom: Spacing.sm,
                    ),
                    child: NoteTile(
                      note: note,
                      onTap: () => context.push('/notes/${note.id}'),
                    ),
                  );
                },
                childCount: notes.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected ? AppColors.textOnPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
