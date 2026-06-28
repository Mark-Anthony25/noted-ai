import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/chat_head_avatar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatHeadPreviewScreen extends StatefulWidget {
  const ChatHeadPreviewScreen({super.key});

  @override
  State<ChatHeadPreviewScreen> createState() => _ChatHeadPreviewScreenState();
}

class _ChatHeadPreviewScreenState extends State<ChatHeadPreviewScreen>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.lg, Spacing.lg, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Home', style: AppTextStyles.displaySmall.copyWith(
                              color: context.cp.textTertiary,
                            )),
                            const SizedBox(height: Spacing.xxs),
                            Text('Saturday, June 28', style: AppTextStyles.bodyMedium.copyWith(
                              color: context.cp.textTertiary,
                            )),
                          ],
                        ),
                      ),
                      Icon(LucideIcons.bell, size: 20, color: context.cp.textTertiary),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.xxxl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _mockQuickAction(LucideIcons.filePlus, context.cp.textTertiary),
                      _mockQuickAction(LucideIcons.bellPlus, context.cp.textTertiary),
                      _mockQuickAction(LucideIcons.search, context.cp.textTertiary),
                      _mockQuickAction(LucideIcons.messageCircle, context.cp.textTertiary),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.xxxl),
                ...List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(Spacing.lg, 0, Spacing.lg, Spacing.sm),
                    child: Container(
                      height: 72,
                      decoration: BoxDecoration(
                        color: context.cp.surfaceVariant,
                        borderRadius: BorderRadius.circular(Dimensions.radiusMd),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          if (_isExpanded)
            GestureDetector(
              onTap: () => setState(() => _isExpanded = false),
              child: Container(color: Colors.black45),
            ),
          Positioned(
            right: Spacing.lg,
            bottom: Spacing.xxxxl,
            child: GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: ChatHeadAvatar(
                isExpanded: _isExpanded,
                unreadCount: _isExpanded ? null : 3,
              ),
            ),
          ),
          if (_isExpanded)
            Positioned(
              right: Spacing.lg,
              bottom: 120,
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: context.cp.surface,
                  borderRadius: BorderRadius.circular(Dimensions.radiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Spacing.lg),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [context.cp.primary, context.cp.primaryAlt]),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Dimensions.radiusLg),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(LucideIcons.sparkles, color: context.cp.textOnPrimary, size: 18),
                          const SizedBox(width: Spacing.sm),
                          Text('Corvus', style: AppTextStyles.titleMedium.copyWith(
                            color: context.cp.textOnPrimary,
                          )),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => setState(() => _isExpanded = false),
                            child: Icon(LucideIcons.minus, color: context.cp.textOnPrimary, size: 20),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Spacing.lg),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('How can I help you?', style: AppTextStyles.bodyMedium.copyWith(
                              color: context.cp.textTertiary,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 120,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.sm),
                decoration: BoxDecoration(
                  color: context.cp.surfaceElevated,
                  borderRadius: BorderRadius.circular(Dimensions.radiusFull),
                ),
                child: Text('Tap the chat head to expand', style: AppTextStyles.labelMedium.copyWith(
                  color: context.cp.textTertiary,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mockQuickAction(IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
          ),
          child: Icon(icon, size: 20, color: color),
        ),
      ],
    );
  }
}
