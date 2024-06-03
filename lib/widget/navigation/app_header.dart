import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../foundation/constant/resources.dart';
import '../text/app_text.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const AppHeader(
      {this.text = '',
      this.backgroundColor = Colors.white,
      this.onTapCloseButton,
      this.leading = const BackButton(),
      this.rightWidget,
      this.showBottomLine = true,
      Key? key})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  final VoidCallback? onTapCloseButton;
  final Widget? rightWidget;
  final Widget? leading;
  final bool showBottomLine;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      leading: leading,
      title: AppText(
        text: text,
        fontSize: Res.titleSize,
        color: AppColors.textDark,
        fontWeight: Res.titleFontWeight,
      ),
      bottom: showBottomLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(2),
              child: Container(
                height: 2,
                color: AppColors.borderLight,
              ),
            )
          : null,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.textDark),
      automaticallyImplyLeading: onTapCloseButton != null,
      actions: [
        Visibility(
          visible: onTapCloseButton != null,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: onTapCloseButton,
          ),
        ),
        Visibility(
          visible: rightWidget != null,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: rightWidget ?? const SizedBox(),
          ),
        ),
      ],
    );
  }
}
