import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
          _section(context, 'Appearance'),
          _toggle(context, LucideIcons.moon, 'Dark Mode', true),
          _row(context, LucideIcons.type, 'Font Size', subtitle: 'System default'),
          _section(context, 'Notifications'),
          _toggle(context, LucideIcons.bell, 'Push Notifications', true),
          _toggle(context, LucideIcons.volume2, 'Sound', false),
          _toggle(context, LucideIcons.vibrate, 'Haptic Feedback', true),
          _section(context, 'Data & Privacy'),
          _row(context, LucideIcons.database, 'Manage Storage'),
          _row(context, LucideIcons.download, 'Export Data'),
          _row(context, LucideIcons.trash2, 'Clear All Data'),
          _section(context, 'About'),
          _row(context, LucideIcons.info, 'Version', subtitle: '1.0.0'),
          _row(context, LucideIcons.fileText, 'Terms of Service'),
          _row(context, LucideIcons.shield, 'Privacy Policy'),
        ],
      ),
    );
  }

  Widget _section(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.xxl, bottom: Spacing.sm),
      child: Text(title, style: AppTextStyles.titleMedium.copyWith(color: context.cp.primary)),
    );
  }

  Widget _row(BuildContext context, IconData icon, String title, {String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: context.cp.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: context.cp.textSecondary),
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
          Icon(LucideIcons.chevronRight, size: 14, color: context.cp.textTertiary),
        ],
      ),
    );
  }

  Widget _toggle(BuildContext context, IconData icon, String title, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: context.cp.surface,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: context.cp.textSecondary),
          const SizedBox(width: Spacing.md),
          Expanded(child: Text(title, style: AppTextStyles.titleMedium)),
          SizedBox(
            height: 28,
            child: Switch(
              value: value,
              onChanged: (_) {},
              activeTrackColor: context.cp.primary.withValues(alpha: 0.3),
              activeThumbColor: context.cp.primary,
              inactiveTrackColor: context.cp.disabled,
              inactiveThumbColor: context.cp.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
