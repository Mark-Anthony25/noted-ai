import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
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
    final user = PlaceholderData.user;
    final recentNotes = PlaceholderData.notes.take(3).toList();
    final upcomingReminders = PlaceholderData.reminders
        .where((r) => !r.isCompleted && r.dueDate.isAfter(now.subtract(const Duration(hours: 1))))
        .take(3)
        .toList();
    final recentMemories = PlaceholderData.memories.take(2).toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context, user)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.xl, Spacing.lg, Spacing.xl),
                child: QuickActionRow(
                  onNewNote: () => context.push('/notes'),
                  onRemindMe: () => context.push('/reminders'),
                  onChat: () => context.push('/chat'),
                ),
              ),
            ),
            if (recentNotes.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: SectionHeader(title: 'Recent notes', actionLabel: 'See all', onAction: () => context.push('/notes')),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: NoteTile(note: recentNotes[index], onTap: () => context.push('/notes/${recentNotes[index].id}')),
                  ),
                  childCount: recentNotes.length,
                ),
              ),
            ],
            if (upcomingReminders.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: Spacing.xxl),
                  child: SectionHeader(title: 'Upcoming', actionLabel: 'See all', onAction: () => context.push('/reminders')),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: ReminderCard(reminder: upcomingReminders[index]),
                  ),
                  childCount: upcomingReminders.length,
                ),
              ),
            ],
            if (recentMemories.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: Spacing.xxl),
                  child: SectionHeader(title: 'Recent memories', actionLabel: 'See all', onAction: () => context.push('/memory')),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: MemoryCard(memory: recentMemories[index], onTap: () => context.push('/memory/${recentMemories[index].id}')),
                  ),
                  childCount: recentMemories.length,
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: Spacing.section)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, var user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_greeting(DateTime.now().hour), style: AppTextStyles.displaySmall),
                const SizedBox(height: Spacing.xxs),
                Text(DateFormat('EEEE, MMMM d').format(DateTime.now()), style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.push('/notifications'),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: context.cp.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(LucideIcons.bell, size: 18, color: context.cp.textSecondary),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          GestureDetector(
            onTap: () => context.push('/profile'),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: context.cp.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(LucideIcons.user, size: 18, color: context.cp.primary),
            ),
          ),
        ],
      ),
    );
  }

  String _greeting(int hour) {
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
