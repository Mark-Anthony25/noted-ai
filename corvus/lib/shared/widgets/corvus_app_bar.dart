import 'package:flutter/material.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';

class CorvusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final Widget? leading;

  const CorvusAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.appBarHeight + Spacing.sm,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: AppColors.background,
      child: Row(
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
            )
          else
            const SizedBox(width: Spacing.lg),
          ?leading,
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.headlineSmall,
            ),
          ),
          if (actions != null) ...actions!,
          const SizedBox(width: Spacing.sm),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.appBarHeight + Spacing.sm);
}
