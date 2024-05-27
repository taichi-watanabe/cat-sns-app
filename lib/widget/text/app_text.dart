import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {required this.text,
      this.fontSize = 13,
      this.maxLines,
      this.fontWeight = FontWeight.normal,
      this.color = AppColorsUpdate.black01,
      this.lineHeight,
      this.textAlign = TextAlign.start,
      this.textOverflow,
      Key? key})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? lineHeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: lineHeight,
          overflow: textOverflow),
    );
  }
}
