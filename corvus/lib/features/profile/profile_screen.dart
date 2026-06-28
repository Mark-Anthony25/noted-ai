import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = PlaceholderData.user;

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
                child: Text('Profile', style: AppTextStyles.displaySmall),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryAlt],
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.radiusXl),
                      ),
                      child: Center(
                        child: Text(
                          user.name.split(' ').map((n) => n[0]).join(),
                          style: AppTextStyles.displaySmall.copyWith(
                            color: AppColors.textOnPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.lg),
                    Text(user.name, style: AppTextStyles.headlineMedium),
                    const SizedBox(height: Spacing.xxs),
                    Text(user.email, style: AppTextStyles.bodyMedium),
                    const SizedBox(height: Spacing.xxl),
                    Row(
                      children: [
                        _statCard('Notes', user.noteCount.toString(), LucideIcons.fileText),
                        _statCard('Memories', user.memoryCount.toString(), LucideIcons.brain),
                        _statCard('Streak', '${user.streak}d', LucideIcons.zap),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.xxxl, Spacing.lg, Spacing.sm,
                ),
                child: Text('Account', style: AppTextStyles.titleLarge),
              ),
            ),
            _menuItem(LucideIcons.user, 'Edit Profile', () {}),
            _menuItem(LucideIcons.bell, 'Notifications', () => context.push('/notifications')),
            _menuItem(LucideIcons.calendar, 'Calendar', () => context.push('/calendar')),
            _menuItem(LucideIcons.messageCircle, 'Chat Head Preview', () => context.push('/chat-head-preview')),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg, Spacing.xxl, Spacing.lg, Spacing.sm,
                ),
                child: Text('Settings', style: AppTextStyles.titleLarge),
              ),
            ),
            _menuItem(LucideIcons.settings, 'Preferences', () => context.push('/settings')),
            _menuItem(LucideIcons.shield, 'Privacy', () {}),
            _menuItem(LucideIcons.helpCircle, 'Help & Support', () {}),
            _menuItem(LucideIcons.logOut, 'Sign Out', () => context.go('/sign-in'), isDestructive: true),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.xs),
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(height: Spacing.sm),
            Text(value, style: AppTextStyles.amount),
            const SizedBox(height: Spacing.xxs),
            Text(label, style: AppTextStyles.labelSmall),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String label, VoidCallback onTap, {bool isDestructive = false}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Spacing.lg, 0, Spacing.lg, Spacing.xs,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(Spacing.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isDestructive ? AppColors.error : AppColors.textSecondary,
                ),
                const SizedBox(width: Spacing.md),
                Text(
                  label,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: isDestructive ? AppColors.error : null,
                  ),
                ),
                const Spacer(),
                const Icon(
                  LucideIcons.chevronRight,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
