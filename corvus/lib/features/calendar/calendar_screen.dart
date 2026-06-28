import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';

import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/schedule_card.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1);
    final lastDay = DateTime(now.year, now.month + 1, 0);
    final firstWeekday = firstDay.weekday % 7;

    final dayEvents = PlaceholderData.reminders.where((r) =>
        r.dueDate.year == _selectedDate.year &&
        r.dueDate.month == _selectedDate.month &&
        r.dueDate.day == _selectedDate.day).toList();

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
                child: Text('Calendar', style: AppTextStyles.displaySmall),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
                      onPressed: () {},
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(now),
                      style: AppTextStyles.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.chevronRight, color: AppColors.textPrimary),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.md, Spacing.lg, 0,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: firstWeekday + lastDay.day,
                  itemBuilder: (context, index) {
                    if (index < firstWeekday) {
                      return const SizedBox();
                    }
                    final day = index - firstWeekday + 1;
                    final date = DateTime(now.year, now.month, day);
                    final isToday = date.day == now.day &&
                        date.month == now.month;
                    final isSelected = date.day == _selectedDate.day &&
                        date.month == _selectedDate.month;

                    return GestureDetector(
                      onTap: () => setState(() => _selectedDate = date),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : isToday
                                  ? AppColors.primary.withValues(alpha: 0.15)
                                  : null,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            day.toString(),
                            style: AppTextStyles.titleSmall.copyWith(
                              color: isSelected
                                  ? AppColors.textOnPrimary
                                  : isToday
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                              fontWeight: isToday ? FontWeight.w600 : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.xxl, Spacing.lg, Spacing.md,
                ),
                child: Text(
                  DateFormat('EEEE, MMMM d').format(_selectedDate),
                  style: AppTextStyles.titleLarge,
                ),
              ),
            ),
            if (dayEvents.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.xxxl),
                  child: Center(
                    child: Text(
                      'No events for this day',
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final reminder = dayEvents[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: Spacing.lg, right: Spacing.lg, bottom: Spacing.sm,
                      ),
                      child: ScheduleCard(
                        title: reminder.title,
                        description: reminder.description,
                        startTime: reminder.dueDate,
                        endTime: reminder.dueDate.add(const Duration(hours: 1)),
                      ),
                    );
                  },
                  childCount: dayEvents.length,
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
