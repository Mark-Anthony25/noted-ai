import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
    final color = accentColor ?? context.cp.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: context.cp.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusSm),
        ),
        child: Row(
          children: [
            Container(width: 3, height: 44, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('h:mm a').format(startTime), style: AppTextStyles.labelSmall.copyWith(color: color)),
                  const SizedBox(height: Spacing.xxs),
                  Text(title, style: AppTextStyles.titleMedium),
                  if (description != null) ...[
                    const SizedBox(height: Spacing.xxs),
                    Text(description!, style: AppTextStyles.bodySmall),
                  ],
                ],
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Text('${_durationMinutes()}m', style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }

  int _durationMinutes() => endTime.difference(startTime).inMinutes;
}
