// This function is called when the app first starts up, and it checks to see if there is a more recent
// version of the app available. If there is, it shows a dialog that asks the user if they want to
// update the app. The user cannot dismiss the dialog until they choose an option.
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../foundation/constant/constants.dart';

void showUpdateDialog(bool needUpdate, BuildContext context) {
  // If the app does not need to be updated, return.
  if (!needUpdate) return;

  // Show a dialog.
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        child: _createPlatformAlertDialog(),
        onWillPop: () async => false,
      );
    },
  );
}

// PlatformAlertDialog is a widget that is created depending on the platform
//  (iOS or Android).

// For iOS, it uses CupertinoAlertDialog.
// For Android, it uses AlertDialog.
Widget _createPlatformAlertDialog() {
  const title = "バージョン更新のお知らせ";
  const message = "新しいバージョンのアプリが利用可能です。ストアより更新版を入手して、ご利用下さい。";
  const btnLabel = "今すぐ更新";

  // Create a widget for iOS.
  Widget iosWidget = CupertinoAlertDialog(
    title: const Text(title),
    content: const Text(message),
    actions: <Widget>[
      TextButton(
        child: const Text(
          btnLabel,
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {/* _launchURL(Constants.of().appleStoreUrl) */},
      ),
    ],
  );

  // Create a widget for Android.
  Widget androidWidget = AlertDialog(
    title: const Text(title),
    content: const Text(message),
    actions: <Widget>[
      TextButton(
        child: const Text(
          btnLabel,
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {/* _launchURL(Constants.of().playStoreUrl) */},
      ),
    ],
  );

  // Return the widget depending on the platform.
  return Platform.isIOS ? iosWidget : androidWidget;
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
