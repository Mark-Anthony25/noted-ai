import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = _PlaceholderData.notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all read',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        itemCount: notifications.length,
        separatorBuilder: (_, a) => const SizedBox(height: Spacing.xs),
        itemBuilder: (context, index) {
          final n = notifications[index];
          return Container(
            padding: const EdgeInsets.all(Spacing.lg),
            decoration: BoxDecoration(
              color: n.isRead ? AppColors.background : AppColors.surface,
              borderRadius: BorderRadius.circular(Dimensions.radiusSm),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: n.isRead ? Colors.transparent : AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: Spacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        n.title,
                        style: (n.isRead ? AppTextStyles.titleMedium : AppTextStyles.titleMedium).copyWith(
                          fontWeight: n.isRead ? FontWeight.w400 : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: Spacing.xxs),
                      Text(n.body, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: Spacing.xs),
                      Text(DateFormat('h:mm a').format(n.timestamp), style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AppNotification {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;

  const _AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });
}

class _PlaceholderData {
  static final notifications = [
    _AppNotification(
      id: 'n1', title: 'Sprint Review tomorrow', body: 'Prepare the demo environment.',
      timestamp: DateTime(2026, 6, 29, 14, 0), isRead: false,
    ),
    _AppNotification(
      id: 'n2', title: 'New memory saved', body: 'Corvus remembered your coffee order.',
      timestamp: DateTime(2026, 6, 28, 11, 30), isRead: false,
    ),
    _AppNotification(
      id: 'n3', title: 'Weekly summary ready', body: '12 notes, 5 reminders this week.',
      timestamp: DateTime(2026, 6, 27, 22, 0), isRead: true,
    ),
  ];
}
