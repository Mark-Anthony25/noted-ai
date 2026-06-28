import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(Spacing.lg),
        children: [
          _section('Appearance'),
          _toggle(LucideIcons.moon, 'Dark Mode', true),
          _row(LucideIcons.type, 'Font Size', subtitle: 'System default'),
          _section('Notifications'),
          _toggle(LucideIcons.bell, 'Push Notifications', true),
          _toggle(LucideIcons.volume2, 'Sound', false),
          _toggle(LucideIcons.vibrate, 'Haptic Feedback', true),
          _section('Data & Privacy'),
          _row(LucideIcons.database, 'Manage Storage'),
          _row(LucideIcons.download, 'Export Data'),
          _row(LucideIcons.trash2, 'Clear All Data'),
          _section('About'),
          _row(LucideIcons.info, 'Version', subtitle: '1.0.0'),
          _row(LucideIcons.fileText, 'Terms of Service'),
          _row(LucideIcons.shield, 'Privacy Policy'),
        ],
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.xxl, bottom: Spacing.sm),
      child: Text(title, style: AppTextStyles.titleMedium.copyWith(color: AppColors.primary)),
    );
  }

  Widget _row(IconData icon, String title, {String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.titleMedium),
                if (subtitle != null) Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const Icon(LucideIcons.chevronRight, size: 14, color: AppColors.textTertiary),
        ],
      ),
    );
  }

  Widget _toggle(IconData icon, String title, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: Spacing.md),
          Expanded(child: Text(title, style: AppTextStyles.titleMedium)),
          SizedBox(
            height: 28,
            child: Switch(
              value: value,
              onChanged: (_) {},
              activeTrackColor: AppColors.primary.withValues(alpha: 0.3),
              activeThumbColor: AppColors.primary,
              inactiveTrackColor: AppColors.disabled,
              inactiveThumbColor: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
