import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:cat_sns_app/state/notifier/registration/registration_notifier.dart';
import 'package:cat_sns_app/widget/button/app_button.dart';
import 'package:cat_sns_app/widget/form/app_form.dart';
import 'package:cat_sns_app/widget/form/login_page_frame.dart';
import 'package:cat_sns_app/widget/indicator/full_screen_indicator.dart';
import 'package:cat_sns_app/widget/navigation/app_header.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _registrationNotifier =
        ref.watch(registrationNotifierProvider.notifier);
    var _registrationState = ref.watch(registrationNotifierProvider);
    bool _canTapSignupPageButton =
        ref.watch(registrationNotifierProvider).checkSignupPageButton;

    final _emailFocusNode = useFocusNode();
    final _passwordFocusNode = useFocusNode();

    useFuture(useMemoized((() {
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
      return null;
    })));

    Widget _formContents() {
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(text: 'にゃ〜（メールアドレス）', fontSize: 14),
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
                    _registrationNotifier.setMailAddress(value);
                    if (_emailFieldKey.currentState?.hasError == true) {
                      _emailFieldKey.currentState?.validate();
                    }
                  },
                  validationCallBack: (value) =>
                      _registrationNotifier.mailValidator(value),
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
                    _registrationNotifier.setPassword(value);
                    if (_passwordFieldKey.currentState?.hasError == true) {
                      _passwordFieldKey.currentState?.validate();
                    }
                  },
                  validationCallBack: (value) =>
                      _registrationNotifier.passValidator(value),
                  textInputType: TextInputType.visiblePassword,
                  isIconVisible: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: 'パスワードを忘れた方'),
                const SizedBox(width: 8),
                SvgPicture.asset(Assets.images.svg.angleRightSolid)
              ],
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
                text: 'ログイン',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
              borderRadius: 32,
              onPressed: () {
                _canTapSignupPageButton
                    ? () async {
                        //_onTapRegisterButton();
                      }
                    : null;
              }),
        ],
      );
    }

    Future<bool> _willPopCallback() async {
      _registrationNotifier.setName('');
      _registrationNotifier.setMailAddress('');
      _registrationNotifier.setPassword('');
      _registrationNotifier.setConfirmPassword('');
      return true;
    }

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: GestureDetector(
        onTap: () {
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColorsUpdate.baseGray,
              appBar: AppHeader(
                text: 'ログイン',
                leading: BackButton(onPressed: () {
                  context.router.pop();
                }),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: LoginPageFrame(
                  _formContents(),
                  _formButton(),
                ),
              ),
            ),
            if (_registrationState.isLoading) FullScreenIndicator()
          ],
        ),
      ),
    );
  }
}
