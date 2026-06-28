import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime endTime;
  final Color? accentColor;
  final VoidCallback? onTap;

  const ScheduleCard({
    super.key,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    this.accentColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('h:mm a').format(startTime),
                  style: AppTextStyles.labelMedium.copyWith(color: color),
                ),
                const SizedBox(height: Spacing.xxs),
                Text(
                  title,
                  style: AppTextStyles.titleMedium,
                ),
                if (description != null) ...[
                  const SizedBox(height: Spacing.xxs),
                  Text(
                    description!,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ],
            ),
            const Spacer(),
            Text(
              '${_durationMinutes()}m',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _durationMinutes() {
    return endTime.difference(startTime).inMinutes;
  }
}
