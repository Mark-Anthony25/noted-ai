import 'package:flutter/material.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/reminder_card.dart';
import 'package:corvus/shared/widgets/section_header.dart';

class ReminderListScreen extends StatelessWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    final todayReminders = PlaceholderData.reminders
        .where((r) => !r.isCompleted && r.dueDate.isAfter(today) && r.dueDate.isBefore(tomorrow)).toList();
    final tomorrowReminders = PlaceholderData.reminders
        .where((r) => !r.isCompleted && r.dueDate.isAfter(tomorrow) && r.dueDate.isBefore(tomorrow.add(const Duration(days: 1)))).toList();
    final weekReminders = PlaceholderData.reminders
        .where((r) => !r.isCompleted && r.dueDate.isAfter(tomorrow.add(const Duration(days: 1)))).toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, Spacing.md),
                child: Text('Reminders', style: AppTextStyles.displaySmall),
              ),
            ),
            if (todayReminders.isNotEmpty) ...[
              SliverToBoxAdapter(child: SectionHeader(title: 'Today')),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: ReminderCard(reminder: todayReminders[index]),
                  ),
                  childCount: todayReminders.length,
                ),
              ),
            ],
            if (tomorrowReminders.isNotEmpty) ...[
              SliverToBoxAdapter(child: Padding(
                padding: const EdgeInsets.only(top: Spacing.xxl),
                child: SectionHeader(title: 'Tomorrow'),
              )),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: ReminderCard(reminder: tomorrowReminders[index]),
                  ),
                  childCount: tomorrowReminders.length,
                ),
              ),
            ],
            if (weekReminders.isNotEmpty) ...[
              SliverToBoxAdapter(child: Padding(
                padding: const EdgeInsets.only(top: Spacing.xxl),
                child: SectionHeader(title: 'This week'),
              )),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm),
                    child: ReminderCard(reminder: weekReminders[index]),
                  ),
                  childCount: weekReminders.length,
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
