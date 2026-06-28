import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/constants/placeholder_data.dart';

import 'package:corvus/shared/widgets/corvus_search_bar.dart';
import 'package:corvus/shared/widgets/section_header.dart';
import 'package:corvus/shared/widgets/reminder_card.dart';
import 'package:corvus/shared/widgets/memory_card.dart';
import 'package:corvus/features/home/widgets/quick_action_row.dart';
import 'package:corvus/features/notes/widgets/note_tile.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final greeting = _getGreeting(now.hour);
    final user = PlaceholderData.user;
    final recentNotes = PlaceholderData.notes.take(3).toList();
    final upcomingReminders = PlaceholderData.reminders
        .where((r) => !r.isCompleted && r.dueDate.isAfter(now.subtract(const Duration(hours: 1))))
        .take(3)
        .toList();
    final recentMemories = PlaceholderData.memories.take(2).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context, greeting, user)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.lg, Spacing.lg, Spacing.md,
                ),
                child: CorvusSearchBar(
                  onTap: () => context.push('/search'),
                  enabled: false,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xxl),
                child: QuickActionRow(
                  onNewNote: () => context.push('/notes'),
                  onRemindMe: () => context.push('/reminders'),
                  onSearch: () => context.push('/search'),
                  onChat: () => context.push('/chat'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Recent Notes',
                actionLabel: 'See all',
                onAction: () => context.push('/notes'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final note = recentNotes[index];
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
                childCount: recentNotes.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: Spacing.xxl),
                child: SectionHeader(
                  title: 'Upcoming',
                  actionLabel: 'See all',
                  onAction: () => context.push('/reminders'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final reminder = upcomingReminders[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: Spacing.lg,
                      right: Spacing.lg,
                      bottom: Spacing.sm,
                    ),
                    child: ReminderCard(reminder: reminder),
                  );
                },
                childCount: upcomingReminders.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: Spacing.xxl),
                child: SectionHeader(
                  title: 'Recent Memories',
                  actionLabel: 'See all',
                  onAction: () => context.push('/memory'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final memory = recentMemories[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: Spacing.lg,
                      right: Spacing.lg,
                      bottom: Spacing.sm,
                    ),
                    child: MemoryCard(
                      memory: memory,
                      onTap: () => context.push('/memory/${memory.id}'),
                    ),
                  );
                },
                childCount: recentMemories.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String greeting, var user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg, Spacing.lg, Spacing.lg, 0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$greeting, ${user.name.split(' ').first}',
                  style: AppTextStyles.displaySmall,
                ),
                const SizedBox(height: Spacing.xxs),
                Text(
                  DateFormat('EEEE, MMMM d').format(DateTime.now()),
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(Dimensions.radiusMd),
                ),
                child: const Icon(
                  LucideIcons.bell,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
