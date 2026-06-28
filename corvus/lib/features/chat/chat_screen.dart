import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.cp.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: context.cp.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(LucideIcons.sparkles, color: context.cp.primary, size: 14),
            ),
            const SizedBox(width: Spacing.sm),
            Text('Corvus', style: AppTextStyles.titleMedium),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(0, Spacing.md, 0, Spacing.md),
              itemCount: messages.length,
              itemBuilder: (context, index) => ChatBubble(message: messages[index]),
            ),
          ),
          if (messages.length <= 4)
            SizedBox(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                itemCount: prompts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _messageController.text = prompts[index],
                    child: Container(
                      margin: const EdgeInsets.only(right: Spacing.sm),
                      padding: const EdgeInsets.symmetric(horizontal: Spacing.md, vertical: Spacing.sm),
                      decoration: BoxDecoration(
                        color: context.cp.surface,
                        borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                      ),
                      child: Text(prompts[index], style: AppTextStyles.labelMedium.copyWith(color: context.cp.textTertiary)),
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
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, Spacing.sm + bottomInset),
      decoration: BoxDecoration(
        color: context.cp.background,
        border: Border(top: BorderSide(color: context.cp.divider)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              decoration: BoxDecoration(
                color: context.cp.surface,
                borderRadius: BorderRadius.circular(Dimensions.radiusSm),
              ),
              child: Row(
                children: [
                  Expanded(
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
                  Icon(LucideIcons.paperclip, size: 16, color: context.cp.textTertiary),
                ],
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.cp.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(Dimensions.radiusSm),
            ),
            child: Icon(LucideIcons.arrowUp, size: 18, color: context.cp.primary),
          ),
        ],
      ),
    );
  }
}
