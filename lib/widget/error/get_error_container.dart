/* import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rimawarikun_app/state/notifier/launch/login_notifier.dart';

import '../../../foundation/constant/app_colors.dart';
import '../../../main.dart';
import '../../../model/error_response.dart';
import '../../../router/router.dart';
import '../button/app_text_button.dart';
import '../dialog/error_dialog.dart';
import '../text/app_text.dart';

class GetErrorContainer extends HookConsumerWidget {
  const GetErrorContainer({Key? key, required this.error, this.onTapRetry})
      : super(key: key);

  final Function()? onTapRetry;
  final Object error;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? _statusCode;
    DioError? _dioError;

    // DioErrorの場合はstatusCodeを取得
    if (error is DioError) {
      _dioError = error as DioError;
      final statusCode = _dioError.response?.statusCode;
      _statusCode = statusCode;
    }

    useFuture(
      useMemoized(
        (() async {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            if (_statusCode == 401) {
              var _error = ErrorResponse.fromJson(
                  jsonDecode(_dioError?.response?.toString() ?? ''));

              await showErrorDialog(
                context: context,
                title: _error.title,
                message: _error.message,
              );
              var loginNotifier = ref.watch(loginNotifierProvider.notifier);
              await loginNotifier.loout(isAuthTokenExpired: false).then(
                (value) => router.replaceAll([LoginRoute(useLaunchPage: true)]),
                onError: (_) async {
                  await showErrorDialog(
                          context: context, message: 'ログアウトに失敗しました。')
                      .then((value) =>
                          router.replaceAll([LoginRoute(useLaunchPage: true)]));
                },
              );
            }
          });

          return null;
        }),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          handleStatusCode(_statusCode),
          AppTextButton(
            text: const AppText(
              text: '再度読み込み',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textWhite,
            ),
            width: 220,
            onPressed: () {
              if (onTapRetry != null) onTapRetry!();
            },
          )
        ],
      ),
    );
  }

  Widget handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 403:
        return _maintenanceErrorPage();
      default:
        return _defaultErrorPage();
    }
  }

  Widget _defaultErrorPage() {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/svg/get_error.svg',
            width: 220,
          ),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: AppText(
            text: '通信エラーが発生しました。\n\nネットワーク状況を確認後、再度読み込みボタンをタップして下さい。',
            fontSize: 15,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _maintenanceErrorPage() {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/svg/maintenance.svg',
            width: 220,
          ),
        ),
        const SizedBox(height: 24),
        const AppText(
          text: 'メンテナンス中です',
          fontSize: 17,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
 */