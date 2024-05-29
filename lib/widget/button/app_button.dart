import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../foundation/constant/app_colors.dart';

class AppTextButton extends HookConsumerWidget {
  const AppTextButton(
      {this.backGroundColor = AppColors.primary,
      this.borderColor,
      this.borderWidth,
      required this.onPressed,
      this.height = 48,
      this.width,
      this.margin,
      required this.text,
      this.borderRadius = 8,
      Key? key})
      : super(key: key);
  final Color backGroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final Function()? onPressed;
  final Widget text;
  final double height;
  final double? width;
  final EdgeInsets? margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin,
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth ?? 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: text,
        onPressed: onPressed,
      ),
    );
  }
}
