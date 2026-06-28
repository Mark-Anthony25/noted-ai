import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
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
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Column(
        children: List.generate(count, (index) {
          switch (type) {
            case SkeletonType.card:
              return _buildCardSkeleton();
            case SkeletonType.listItem:
              return _buildListItemSkeleton();
            case SkeletonType.chatBubble:
              return _buildChatBubbleSkeleton(index);
            case SkeletonType.reminder:
              return _buildReminderSkeleton();
            case SkeletonType.circle:
              return _buildCircleSkeleton();
          }
        }),
      ),
    );
  }

  Widget _buildCardSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
    );
  }

  Widget _buildListItemSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.shimmerBase,
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
                    color: AppColors.shimmerBase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 10,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.shimmerBase,
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

  Widget _buildChatBubbleSkeleton(int index) {
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
              color: AppColors.shimmerBase,
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
      ),
    );
  }

  Widget _buildCircleSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.shimmerBase,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
