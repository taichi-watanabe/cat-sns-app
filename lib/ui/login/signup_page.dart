/* import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


@RoutePage()
class SignupPage extends HookConsumerWidget {
  SignupPage({super.key, Key? keyrequired});

  final _formKey = GlobalKey<FormState>();

  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldKey = GlobalKey<FormFieldState>();
  final _conformPasswordFieldKey = GlobalKey<FormFieldState>();
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _registrationNotifier =
        ref.watch(registrationNotifierProvider.notifier);
    var _registrationState = ref.watch(registrationNotifierProvider);
    bool _canTapEmailPageButton =
        ref.watch(registrationNotifierProvider).checkEmailPageButton;
    bool _termsOfUseCheck =
        ref.watch(registrationNotifierProvider).termsOfUseCheck;
    bool _antisocialCheck =
        ref.watch(registrationNotifierProvider).antisocialCheck;
    bool _personalInformationCheck =
        ref.watch(registrationNotifierProvider).personalInformationCheck;
    bool _electronicDeliveryCheck =
        ref.watch(registrationNotifierProvider).electronicDeliveryCheck;

    final _emailFocusNode = useFocusNode();
    final _passwordFocusNode = useFocusNode();
    final _conformPasswordFocusNode = useFocusNode();
    final _friendCodeFocusNode = useFocusNode();

    var _friendCodeController =
        useTextEditingController(text: _registrationState.friendCode);

    useOnAppLifecycleStateChange((_, state) {
      if (state == AppLifecycleState.resumed && friendCode != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _registrationNotifier.useFriendCode(true);
          _registrationNotifier.setFriendCode(friendCode!);
          _friendCodeController.text = friendCode!;
          _registrationNotifier.checkFriendCode();
        });
      }
    });

    useFuture(useMemoized((() {
      if (friendCode != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _registrationNotifier.useFriendCode(true);
          _registrationNotifier.setFriendCode(friendCode!);
          _friendCodeController.text = friendCode!;
          _registrationNotifier.checkFriendCode();
        });
      }
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
      _friendCodeFocusNode.addListener(
        () {
          if (!_friendCodeFocusNode.hasFocus) {
            _friendCodeFieldKey.currentState?.validate();
          }
        },
      );
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
                const AppText(text: 'ログインID（メールアドレス）', fontSize: 14),
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
                _registrationNotifier.setConfirmPassword(value);
                if (_conformPasswordFieldKey.currentState?.hasError == true) {
                  _conformPasswordFieldKey.currentState?.validate();
                }
              },
              validationCallBack: (value) =>
                  _registrationNotifier.confirmPassValidator(value),
              textInputType: TextInputType.visiblePassword,
              isIconVisible: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(text: '紹介コードを利用する'),
              CupertinoSwitch(
                  value: _registrationState.useFriendCode,
                  activeColor: AppColors.primary,
                  onChanged: (value) async {
                    if (_registrationState.useFriendCode) {
                      _registrationNotifier.useFriendCode(false);
                      value == _registrationState.useFriendCode;
                    } else {
                      _registrationNotifier.useFriendCode(true);
                      value == _registrationState.useFriendCode;
                    }
                  }),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _registrationState.useFriendCode
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(text: '紹介コード'),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AppForm(
                                hintSize: 16,
                                fillColor: AppColorsUpdate.white,
                                filled: true,
                                borderSelect: false,
                                fieldKey: _friendCodeFieldKey,
                                focusNode: _friendCodeFocusNode,
                                horizontalPadding: 16,
                                verticalPadding: 14,
                                //initialValue: _registrationState.friendCode,
                                hintText: '紹介コード',
                                onChanged: (value) {
                                  _registrationNotifier.setFriendCode(value);
                                },
                                textInputType: TextInputType.text,
                                controller: _friendCodeController,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 80,
                            height: 51,
                            child: AppTextButton(
                              onPressed: () async {
                                await _registrationNotifier.checkFriendCode();
                                _friendCodeFocusNode.unfocus();
                              },
                              text: const AppText(
                                text: '適用',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColorsUpdate.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                          visible:
                              _registrationState.checkFriendCodeApplyButton,
                          child: FriendCodeValidator(
                              validate: _registrationState.checkFriendCode)),
                    ],
                  )
                : const SizedBox(),
          ),
          const SizedBox(height: 40),
          AgreementCheckContainer(
              checked: _termsOfUseCheck,
              title: '利用規約に合意',
              onTap: () {
                if (_termsOfUseCheck) {
                  _registrationNotifier.setTermsOfUseCheck(false);
                } else {
                  launchUrl('https://rimawarikun.com/static/terms_of_service',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalApplication
                              : LaunchMode.webView)
                      .then(
                    (value) => _registrationNotifier.setTermsOfUseCheck(true),
                  );
                }
              }),
          const SizedBox(height: 16),
          AgreementCheckContainer(
              checked: _antisocialCheck,
              title: '反社会的勢力でないことの表明・確約に関する同意',
              onTap: () {
                if (_antisocialCheck) {
                  _registrationNotifier.setAntisocialCheck(false);
                } else {
                  launchUrl('https://rimawarikun.com/static/anti',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalApplication
                              : LaunchMode.webView)
                      .then(
                    (value) => _registrationNotifier.setAntisocialCheck(true),
                  );
                }
              }),
          const SizedBox(height: 16),
          AgreementCheckContainer(
              checked: _personalInformationCheck,
              title: '個人情報取り扱いに関する同意',
              onTap: () {
                if (_personalInformationCheck) {
                  _registrationNotifier.setPersonalInformationCheck(false);
                } else {
                  launchUrl('https://rimawarikun.com/static/privacy',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalApplication
                              : LaunchMode.webView)
                      .then(
                    (value) =>
                        _registrationNotifier.setPersonalInformationCheck(true),
                  );
                }
              }),
          const SizedBox(height: 16),
          AgreementCheckContainer(
              checked: _electronicDeliveryCheck,
              title: '電子交付の説明',
              onTap: () {
                if (_electronicDeliveryCheck) {
                  _registrationNotifier.setElectronicDeliveryCheck(false);
                } else {
                  launchUrl(
                          'https://rimawarikun.com/static/electronic_delivery',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalApplication
                              : LaunchMode.webView)
                      .then(
                    (value) =>
                        _registrationNotifier.setElectronicDeliveryCheck(true),
                  );
                }
              }),
        ],
      );
    }

    Widget _formButton() {
      Future<void> _onTapRegisterButton() async {
        _registrationNotifier.requestSignup().then((value) {
          router.replace(const RegistrationCompleteAccountRoute());
          FocusScope.of(context).unfocus();
          ref.invalidate(accessTokenProvider);
          ref.watch(fcmTokenNotifierProvider.notifier).updateFcmToken();
        }, onError: (_) {
          showErrorDialog(context: context, message: 'サインアップに失敗しました');
        });
      }

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
              onPressed:
                  //紹介コードを使用する場合
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
                          : null),
        ],
      );
    }

    Future<bool> _willPopCallback() async {
      _registrationNotifier.setMailAddress('');
      _registrationNotifier.setPassword('');
      _registrationNotifier.setConfirmPassword('');
      _registrationNotifier.setFriendCode('');
      _registrationNotifier.useFriendCode(false);
      _registrationNotifier.setTermsOfUseCheck(false);
      _registrationNotifier.setAntisocialCheck(false);
      _registrationNotifier.setPersonalInformationCheck(false);
      _registrationNotifier.setElectronicDeliveryCheck(false);
      return true;
    }

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: GestureDetector(
        onTap: () {
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
          _conformPasswordFocusNode.unfocus();
          _friendCodeFocusNode.unfocus();
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColorsUpdate.baseGray,
              appBar: AppHeader(
                text: 'ログイン情報の設定',
                leading: BackButton(onPressed: () {
                  router.pop();
                }),
              ),
              body: RegisterMailPageFrame(
                _formContents(),
                _formButton(),
              ),
            ),
            if (_registrationState.isLoading) FullScreenIndicator()
          ],
        ),
      ),
    );
  }
}
 */