import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, Spacing.md),
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
                      height: 28,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _chip(context, 'All', true),
                          _chip(context, 'Work', false),
                          _chip(context, 'Personal', false),
                          _chip(context, 'Reading', false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                  child: NoteTile(note: notes[index], onTap: () => context.push('/notes/${notes[index].id}')),
                ),
                childCount: notes.length,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: Spacing.lg)),
          ],
        ),
      ),
    );
  }

  Widget _chip(BuildContext context, String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.md, vertical: Spacing.xxs + 1),
        decoration: BoxDecoration(
          color: selected ? context.cp.primary.withValues(alpha: 0.12) : context.cp.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusFull),
        ),
        child: Text(label, style: AppTextStyles.labelSmall.copyWith(
          color: selected ? context.cp.primary : context.cp.textTertiary,
        )),
      ),
    );
  }
}
