import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPageFrame extends HookWidget {
  const LoginPageFrame(this.formContents, this.formButton, {Key? key})
      : super(key: key);

  final Widget formContents;
  final Widget formButton;

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 8;
    double verticalPadding = 24;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: AppColorsUpdate.baseGray),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: formContents,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: verticalPadding),
              child: formButton,
            ),
          ],
        ),
      ),
    );
  }
}
