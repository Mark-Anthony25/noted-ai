import 'package:flutter/material.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/corvus_search_bar.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/shared/widgets/memory_card.dart';
import 'package:corvus/features/notes/widgets/note_tile.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, Spacing.md),
              child: Text('Search', style: AppTextStyles.displaySmall),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              child: CorvusSearchBar(hintText: 'Search anything...'),
            ),
            const SizedBox(height: Spacing.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              child: Row(
                children: [
                  _filterChip(context, 'All', true),
                  const SizedBox(width: Spacing.sm),
                  _filterChip(context, 'Notes', false),
                  const SizedBox(width: Spacing.sm),
                  _filterChip(context, 'Memories', false),
                  const SizedBox(width: Spacing.sm),
                  _filterChip(context, 'Reminders', false),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xl),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LucideIcons.clock, size: 16, color: context.cp.textTertiary),
                        const SizedBox(width: Spacing.sm),
                        Text('Recent Searches', style: AppTextStyles.titleMedium),
                      ],
                    ),
                    const SizedBox(height: Spacing.md),
                    ...['Project Alpha', 'Coffee order', 'Sprint planning', 'Running goal'].map(
                      (query) => Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.md),
                        child: Row(
                          children: [
                            Icon(LucideIcons.search, size: 16, color: context.cp.textTertiary),
                            const SizedBox(width: Spacing.md),
                            Text(query, style: AppTextStyles.bodyMedium),
                            const Spacer(),
                            Icon(LucideIcons.arrowUpRight, size: 14, color: context.cp.textTertiary),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.xxl),
                    Text('Notes', style: AppTextStyles.titleLarge),
                    const SizedBox(height: Spacing.md),
                    ...PlaceholderData.notes.take(2).map(
                      (note) => Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.sm),
                        child: NoteTile(note: note),
                      ),
                    ),
                    const SizedBox(height: Spacing.xxl),
                    Text('Memories', style: AppTextStyles.titleLarge),
                    const SizedBox(height: Spacing.md),
                    ...PlaceholderData.memories.take(2).map(
                      (memory) => Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.sm),
                        child: MemoryCard(memory: memory),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(BuildContext context, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.sm),
      decoration: BoxDecoration(
        color: isSelected ? context.cp.primary : context.cp.surfaceVariant,
        borderRadius: BorderRadius.circular(Dimensions.radiusFull),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: isSelected ? context.cp.textOnPrimary : context.cp.textSecondary,
        ),
      ),
    );
  }
}
