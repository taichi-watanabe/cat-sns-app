import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/widget/button/app_button.dart';
import 'package:cat_sns_app/widget/form/app_form.dart';
import 'package:cat_sns_app/widget/form/login_page_frame.dart';
import 'package:cat_sns_app/widget/navigation/app_header.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignupPage extends HookConsumerWidget {
  SignupPage({Key? key}) : super(key: key);

  //final _formKey = GlobalKey<FormState>();

  final _nameFieldKey = GlobalKey<FormFieldState>();
  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldKey = GlobalKey<FormFieldState>();
  final _conformPasswordFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final _registrationNotifier =
        ref.watch(registrationNotifierProvider.notifier);
    var _registrationState = ref.watch(registrationNotifierProvider);
    bool _canTapEmailPageButton =
        ref.watch(registrationNotifierProvider).checkEmailPageButton; */

    final _nameFocusNode = useFocusNode();
    final _emailFocusNode = useFocusNode();
    final _passwordFocusNode = useFocusNode();
    final _conformPasswordFocusNode = useFocusNode();

    useFuture(useMemoized((() {
      _nameFocusNode.addListener(
        () {
          if (!_nameFocusNode.hasFocus) {
            _nameFieldKey.currentState?.validate();
          }
        },
      );
      _emailFocusNode.addListener(
        () {
          if (!_emailFocusNode.hasFocus) {
            _emailFieldKey.currentState?.validate();
          }
        },
      );
      _passwordFocusNode.addListener(
        () {
          if (!_passwordFocusNode.hasFocus) {
            _passwordFieldKey.currentState?.validate();
          }
        },
      );
      _conformPasswordFocusNode.addListener(() {
        if (!_conformPasswordFocusNode.hasFocus) {
          _conformPasswordFieldKey.currentState?.validate();
        }
      });
      return null;
    })));

    Widget _formContents() {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.only(bottom: 24),
              alignment: Alignment.centerLeft,
              child: const AppText(
                text: 'ログインID（メールアドレス）とパスワードの設定をしてください',
                color: AppColors.textDark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(text: 'メールアドレス', fontSize: 14),
                const SizedBox(height: 8),
                AppForm(
                  horizontalPadding: 16,
                  verticalPadding: 14,
                  hintSize: 16,
                  fillColor: AppColorsUpdate.white,
                  filled: true,
                  borderSelect: false,
                  fieldKey: _emailFieldKey,
                  focusNode: _emailFocusNode,
                  hintText: 'sample@sample.com',
                  onChanged: (value) {
                    /*  _registrationNotifier.setMailAddress(value);
                    if (_emailFieldKey.currentState?.hasError == true) {
                      _emailFieldKey.currentState?.validate();
                    } */
                  },
                  /* validationCallBack: (value) =>
                      _registrationNotifier.mailValidator(value), */
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(text: 'パスワード', fontSize: 14),
                const SizedBox(height: 8),
                AppForm(
                  horizontalPadding: 16,
                  verticalPadding: 14,
                  hintSize: 16,
                  fillColor: AppColorsUpdate.white,
                  filled: true,
                  borderSelect: false,
                  fieldKey: _passwordFieldKey,
                  focusNode: _passwordFocusNode,
                  hintText: 'パスワード (半角英数字)',
                  onChanged: (value) {
                    /* _registrationNotifier.setPassword(value);
                    if (_passwordFieldKey.currentState?.hasError == true) {
                      _passwordFieldKey.currentState?.validate();
                    } */
                  },
                  /* validationCallBack: (value) =>
                      _registrationNotifier.passValidator(value), */
                  textInputType: TextInputType.visiblePassword,
                  isIconVisible: true,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: const AppText(
              text: 'パスワードの再入力（確認用）',
              fontSize: 14,
              color: AppColors.textMiddle,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            alignment: Alignment.centerLeft,
            child: AppForm(
              horizontalPadding: 16,
              verticalPadding: 14,
              hintSize: 16,
              fillColor: AppColorsUpdate.white,
              filled: true,
              borderSelect: false,
              focusNode: _conformPasswordFocusNode,
              fieldKey: _conformPasswordFieldKey,
              hintText: 'パスワード (半角英数字)',
              onChanged: (value) {
                /* _registrationNotifier.setConfirmPassword(value);
                if (_conformPasswordFieldKey.currentState?.hasError == true) {
                  _conformPasswordFieldKey.currentState?.validate();
                } */
              },
              /* validationCallBack: (value) =>
                  _registrationNotifier.confirmPassValidator(value), */
              textInputType: TextInputType.visiblePassword,
              isIconVisible: true,
            ),
          ),
        ],
      );
    }

    Widget _formButton() {
      /* Future<void> _onTapRegisterButton() async {
        _registrationNotifier.requestSignup().then((value) {
          router.replace(const RegistrationCompleteAccountRoute());
          FocusScope.of(context).unfocus();
          ref.invalidate(accessTokenProvider);
          ref.watch(fcmTokenNotifierProvider.notifier).updateFcmToken();
        }, onError: (_) {
          showErrorDialog(context: context, message: 'サインアップに失敗しました');
        });
      } */

      return Column(
        children: [
          const Divider(
            height: 1,
            color: AppColorsUpdate.gray05,
          ),
          const SizedBox(height: 15),
          AppTextButton(
              height: 56,
              text: const AppText(
                text: '登録する',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
              borderRadius: 32,
              onPressed: () {}
              /* //紹介コードを使用する場合
                  _registrationState.useFriendCode
                      ? _canTapEmailPageButton &&
                              _registrationState.checkFriendCode
                          ? () async {
                              _onTapRegisterButton();
                            }
                          : null
                      :
                      //紹介コードを使用しない場合
                      _canTapEmailPageButton
                          ? () async {
                              _onTapRegisterButton();
                            }
                          : null */
              ),
        ],
      );
    }

    Future<bool> _willPopCallback() async {
      /* _registrationNotifier.setMailAddress('');
      _registrationNotifier.setPassword('');
      _registrationNotifier.setConfirmPassword(''); */
      return true;
    }

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: GestureDetector(
        onTap: () {
          _nameFocusNode.unfocus();
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
          _conformPasswordFocusNode.unfocus();
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColorsUpdate.baseGray,
              appBar: AppHeader(
                text: 'ユーザ登録',
                leading: BackButton(onPressed: () {
                  context.router.pop();
                }),
              ),
              body: LoginPageFrame(
                _formContents(),
                _formButton(),
              ),
            ),
            //if (_registrationState.isLoading) FullScreenIndicator()
          ],
        ),
      ),
    );
  }
}
