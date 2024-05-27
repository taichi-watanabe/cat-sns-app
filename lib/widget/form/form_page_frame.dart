import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormPageFrame extends HookWidget {
  const FormPageFrame(this.formContents, this.formButton, {Key? key})
      : super(key: key);

  final Widget formContents;
  final Widget formButton;

  @override
  Widget build(BuildContext context) {
    double pagePadding = 24;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: pagePadding),
                  child: formContents,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: pagePadding),
              child: formButton,
            ),
          ],
        ),
      ),
    );
  }
}
