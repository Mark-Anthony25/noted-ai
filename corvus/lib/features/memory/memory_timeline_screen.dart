import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';

import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/memory_card.dart';
import 'package:intl/intl.dart';

class MemoryTimelineScreen extends StatelessWidget {
  const MemoryTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final memories = PlaceholderData.memories;

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
                child: Text('Memory Timeline', style: AppTextStyles.displaySmall),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, 0, Spacing.lg, Spacing.xxl,
                ),
                child: Text(
                  'Corvus remembers what matters to you',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final memory = memories[index];
                  final showDateHeader = index == 0 ||
                      memories[index].timestamp.day !=
                          memories[index - 1].timestamp.day;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showDateHeader)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            Spacing.lg, Spacing.md, Spacing.lg, Spacing.sm,
                          ),
                          child: Row(
                            children: [
                              Text(
                                DateFormat('MMMM d, yyyy').format(memory.timestamp),
                                style: AppTextStyles.titleMedium.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: Spacing.sm),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.border,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Spacing.lg,
                          right: Spacing.lg,
                          bottom: Spacing.sm,
                        ),
                        child: MemoryCard(
                          memory: memory,
                          onTap: () => context.push('/memory/${memory.id}'),
                        ),
                      ),
                    ],
                  );
                },
                childCount: memories.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
