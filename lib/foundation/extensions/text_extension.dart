import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

RegExp _urlReg = RegExp(
  r'https?://([\w-]+\.)+[\w-]+(/[\w-./?%&=#]*)?',
);

extension TextExt on Text {
  RichText urlToLink(
    BuildContext context,
  ) {
    final textSpans = <InlineSpan>[];

    data!.splitMapJoin(
      _urlReg,
      onMatch: (Match match) {
        final _match = match[0] ?? '';
        textSpans.add(
          TextSpan(
            text: _match,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async => await launchUrl(
                    Uri.parse(_match),
                    mode: LaunchMode.externalApplication,
                  ),
          ),
        );
        return '';
      },
      onNonMatch: (String text) {
        textSpans.add(
          TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textMiddle,
              height: 1.5,
            ),
          ),
        );
        return '';
      },
    );
    return RichText(text: TextSpan(children: textSpans));
  }
}
