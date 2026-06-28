import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatHeadAvatar extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;
  final bool isExpanded;
  final int? unreadCount;

  const ChatHeadAvatar({
    super.key,
    this.size = Dimensions.chatHeadSize,
    this.onTap,
    this.isExpanded = false,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? 180 : size,
        height: size,
        decoration: BoxDecoration(
          color: context.cp.primary,
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: [
            BoxShadow(
              color: context.cp.primary.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: isExpanded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.sparkles,
                    color: context.cp.textOnPrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Corvus',
                    style: TextStyle(
                      color: context.cp.textOnPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Center(
                    child: Icon(
                      LucideIcons.sparkles,
                      color: context.cp.textOnPrimary,
                      size: 24,
                    ),
                  ),
                  if (unreadCount != null && unreadCount! > 0)
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: context.cp.error,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            unreadCount.toString(),
                            style: TextStyle(
                              color: context.cp.textOnPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
