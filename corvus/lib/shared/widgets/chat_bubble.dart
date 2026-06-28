import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/core/models/message.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
        left: isUser ? Spacing.xxxxl : Spacing.lg,
        right: isUser ? Spacing.lg : Spacing.xxxxl,
        bottom: Spacing.sm,
      ),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _avatar(context),
          const SizedBox(width: Spacing.sm),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: isUser ? context.cp.chatBubbleUser : context.cp.chatBubbleAI,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(Dimensions.radiusMd),
                  topRight: const Radius.circular(Dimensions.radiusMd),
                  bottomLeft: Radius.circular(isUser ? Dimensions.radiusMd : Dimensions.radiusXs),
                  bottomRight: Radius.circular(isUser ? Dimensions.radiusXs : Dimensions.radiusMd),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: AppTextStyles.chatMessage.copyWith(
                      color: isUser ? context.cp.textOnPrimary : context.cp.textPrimary,
                    ),
                  ),
                  const SizedBox(height: Spacing.xxs),
                  Text(
                    _formatTime(message.timestamp),
                    style: AppTextStyles.chatTime.copyWith(
                      color: isUser
                          ? context.cp.textOnPrimary.withValues(alpha: 0.5)
                          : context.cp.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) const SizedBox(width: Spacing.sm),
          if (isUser) _avatar(context),
        ],
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: context.cp.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        message.sender == MessageSender.user ? Icons.person : LucideIcons.bot,
        size: 13,
        color: context.cp.textTertiary,
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
