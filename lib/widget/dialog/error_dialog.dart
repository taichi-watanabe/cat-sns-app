import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

Future showErrorDialog(
    {required BuildContext context,
    String title = 'エラー',
    required String message}) async {
  await showOkAlertDialog(
    context: context,
    title: title,
    message: message,
  );
}
