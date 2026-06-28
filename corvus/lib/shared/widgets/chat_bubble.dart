import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/models/message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    return Padding(
      padding: EdgeInsets.only(
        left: isUser ? Spacing.xxxxl : 0,
        right: isUser ? 0 : Spacing.xxxxl,
        bottom: Spacing.sm,
      ),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _avatar(),
          const SizedBox(width: Spacing.sm),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: isUser
                    ? AppColors.chatBubbleUser
                    : AppColors.chatBubbleAI,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(Dimensions.radiusLg),
                  topRight: const Radius.circular(Dimensions.radiusLg),
                  bottomLeft: Radius.circular(
                    isUser ? Dimensions.radiusLg : Dimensions.radiusXs,
                  ),
                  bottomRight: Radius.circular(
                    isUser ? Dimensions.radiusXs : Dimensions.radiusLg,
                  ),
                ),
                border: isUser
                    ? null
                    : Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: AppTextStyles.chatMessage.copyWith(
                      color: isUser
                          ? AppColors.textOnPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    _formatTime(message.timestamp),
                    style: AppTextStyles.chatTime.copyWith(
                      color: isUser
                          ? AppColors.textOnPrimary.withValues(alpha: 0.7)
                          : AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) const SizedBox(width: Spacing.sm),
          if (isUser) _avatar(),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: AppColors.surfaceVariant,
        shape: BoxShape.circle,
      ),
      child: Icon(
        message.sender == MessageSender.user
            ? Icons.person
            : Icons.auto_awesome,
        size: 14,
        color: AppColors.textSecondary,
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
