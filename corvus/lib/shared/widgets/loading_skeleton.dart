import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:shimmer/shimmer.dart';

enum SkeletonType { card, listItem, chatBubble, reminder, circle }

class LoadingSkeleton extends StatelessWidget {
  final SkeletonType type;
  final int count;

  const LoadingSkeleton({
    super.key,
    this.type = SkeletonType.card,
    this.count = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.cp.shimmerBase,
      highlightColor: context.cp.shimmerHighlight,
      child: Column(
        children: List.generate(count, (index) {
          switch (type) {
            case SkeletonType.card:
              return _buildCardSkeleton(context);
            case SkeletonType.listItem:
              return _buildListItemSkeleton(context);
            case SkeletonType.chatBubble:
              return _buildChatBubbleSkeleton(context, index);
            case SkeletonType.reminder:
              return _buildReminderSkeleton(context);
            case SkeletonType.circle:
              return _buildCircleSkeleton(context);
          }
        }),
      ),
    );
  }

  Widget _buildCardSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: context.cp.shimmerBase,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
    );
  }

  Widget _buildListItemSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.cp.shimmerBase,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.cp.shimmerBase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 10,
                  width: 150,
                  decoration: BoxDecoration(
                    color: context.cp.shimmerBase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubbleSkeleton(BuildContext context, int index) {
    final isRight = index.isEven;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: context.cp.shimmerBase,
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: context.cp.shimmerBase,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
    );
  }

  Widget _buildCircleSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: context.cp.shimmerBase,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
