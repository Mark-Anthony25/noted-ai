import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/models/notification.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = PlaceholderData.notifications;

    final todayNotifs = notifications.where((n) =>
        n.timestamp.day == DateTime.now().day &&
        n.timestamp.month == DateTime.now().month).toList();
    final yesterdayNotifs = notifications.where((n) =>
        n.timestamp.day == DateTime.now().day - 1).toList();
    final earlierNotifs = notifications.where((n) =>
        n.timestamp.day < DateTime.now().day - 1).toList();

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
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Notifications', style: AppTextStyles.displaySmall),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Mark all read',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (todayNotifs.isNotEmpty) ...[
              _sectionHeader('Today'),
              ...todayNotifs.map((n) => _notificationTile(n)),
            ],
            if (yesterdayNotifs.isNotEmpty) ...[
              _sectionHeader('Yesterday'),
              ...yesterdayNotifs.map((n) => _notificationTile(n)),
            ],
            if (earlierNotifs.isNotEmpty) ...[
              _sectionHeader('Earlier'),
              ...earlierNotifs.map((n) => _notificationTile(n)),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Spacing.lg, Spacing.lg, Spacing.lg, Spacing.sm,
        ),
        child: Text(title, style: AppTextStyles.titleLarge),
      ),
    );
  }

  Widget _notificationTile(AppNotification notification) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Spacing.lg, 0, Spacing.lg, Spacing.xs,
        ),
        child: Container(
          padding: const EdgeInsets.all(Spacing.lg),
          decoration: BoxDecoration(
            color: notification.isRead ? AppColors.background : AppColors.surface,
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            border: Border.all(
              color: notification.isRead ? AppColors.divider : AppColors.border,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: notification.isRead ? Colors.transparent : AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: notification.isRead ? FontWeight.w400 : FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: Spacing.xxs),
                    Text(
                      notification.body,
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: Spacing.xs),
                    Text(
                      DateFormat('h:mm a').format(notification.timestamp),
                      style: AppTextStyles.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
