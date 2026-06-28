import 'package:flutter/material.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
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
      height: preferredSize.height,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: context.cp.background,
      child: Row(
        children: [
          if (showBack)
            IconButton(
              icon: Icon(Icons.arrow_back, color: context.cp.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
            )
          else
            const SizedBox(width: Spacing.lg),
          ?leading,

          Expanded(child: Text(title, style: AppTextStyles.headlineSmall.copyWith(color: context.cp.textPrimary))),
          if (actions != null) ...actions!,
          const SizedBox(width: Spacing.sm),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.appBarHeight + 8);
}
