import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/chat_bubble.dart';

import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = PlaceholderData.messages;
    final prompts = PlaceholderData.suggestedPrompts;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.textOnPrimary,
                size: 16,
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Text('Corvus', style: AppTextStyles.titleMedium),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.info, size: 20),
            color: AppColors.textSecondary,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(
                Spacing.lg, Spacing.md, Spacing.lg, 0,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          if (messages.length <= 4)
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: Spacing.sm),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                itemCount: prompts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _messageController.text = prompts[index];
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: Spacing.sm),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.lg,
                        vertical: Spacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        prompts[index],
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Spacing.lg,
        Spacing.sm,
        Spacing.lg,
        Spacing.sm + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            ),
            child: const Icon(
              LucideIcons.paperclip,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(Dimensions.radiusMd),
              ),
              child: TextField(
                controller: _messageController,
                style: AppTextStyles.chatMessage,
                decoration: InputDecoration(
                  hintText: 'Message Corvus...',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: Spacing.md),
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            ),
            child: const Icon(
              LucideIcons.arrowUp,
              size: 18,
              color: AppColors.textOnPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
