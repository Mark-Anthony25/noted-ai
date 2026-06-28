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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Settings', style: AppTextStyles.headlineSmall),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(Spacing.lg),
          children: [
            _sectionHeader('Appearance'),
            const SizedBox(height: Spacing.sm),
            _settingTile(
              LucideIcons.moon,
              'Dark Mode',
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeTrackColor: AppColors.primary,
                activeThumbColor: AppColors.textOnPrimary,
              ),
            ),
            _settingTile(
              LucideIcons.type,
              'Font Size',
              subtitle: 'System default',
              trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary),
            ),
            _sectionHeader('Notifications'),
            const SizedBox(height: Spacing.sm),
            _settingTile(
              LucideIcons.bell,
              'Push Notifications',
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeTrackColor: AppColors.primary,
                activeThumbColor: AppColors.textOnPrimary,
              ),
            ),
            _settingTile(
              LucideIcons.volume2,
              'Sound',
              trailing: Switch(
                value: false,
                onChanged: (_) {},
                activeTrackColor: AppColors.primary,
                activeThumbColor: AppColors.textOnPrimary,
              ),
            ),
            _settingTile(
              LucideIcons.vibrate,
              'Haptic Feedback',
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeTrackColor: AppColors.primary,
                activeThumbColor: AppColors.textOnPrimary,
              ),
            ),
            _sectionHeader('Data & Privacy'),
            const SizedBox(height: Spacing.sm),
            _settingTile(LucideIcons.database, 'Manage Storage', trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary)),
            _settingTile(LucideIcons.download, 'Export Data', trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary)),
            _settingTile(LucideIcons.trash2, 'Clear All Data', trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary)),
            _sectionHeader('About'),
            const SizedBox(height: Spacing.sm),
            _settingTile(LucideIcons.info, 'Version', subtitle: '1.0.0'),
            _settingTile(LucideIcons.fileText, 'Terms of Service', trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary)),
            _settingTile(LucideIcons.shield, 'Privacy Policy', trailing: const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary)),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.xxl, bottom: Spacing.sm),
      child: Text(title, style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary)),
    );
  }

    Widget _settingTile(IconData icon, String title, {String? subtitle, Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.titleMedium),
                if (subtitle != null) ...[
                  const SizedBox(height: Spacing.xxs),
                  Text(subtitle, style: AppTextStyles.bodySmall),
                ],
              ],
            ),
          ),
              ?trailing,
        ],
      ),
    );
  }
}
