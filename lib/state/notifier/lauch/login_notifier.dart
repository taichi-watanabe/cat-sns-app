import 'package:cat_sns_app/foundation/utils/logger.dart';
import 'package:cat_sns_app/repository/preferences/preferences_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../foundation/constant/strings.dart';
import '../../../repository/auth/auth_repository.dart';

part 'login_notifier.freezed.dart';
part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginItems build() {
    return LoginItems();
  }

  void setMail(String value) => state = state.copyWith(mail: value);
  void setPassword(String value) => state = state.copyWith(password: value);

  String? mailValidator(String? value) {
    RegExp regExp = RegExp(Strings.mailPattern);
    if (value == null || value.isEmpty) {
      return Strings.mailEmptyMessage;
    } else if (!regExp.hasMatch(value)) {
      return Strings.mailValidateMessage;
    }
    return null;
  }

  String? passValidator(String? value) {
    RegExp regExp = RegExp(Strings.pwdPattern);
    if (value == null || value.isEmpty) {
      return Strings.passEmptyMessage;
    } else if (!regExp.hasMatch(value)) {
      return Strings.passValidateMessage;
    }
    return null;
  }

  /* Future login() async {
    String? mailError = mailValidator(state.mail);
    String? passError = passValidator(state.password);

    if (mailError != null || passError != null) {
      String errorMessage = '';
      if (mailError != null) {
        errorMessage += mailError;
      }

      if (mailError != null && passError != null) {
        errorMessage += '\n';
      }

      if (passError != null) {
        errorMessage += passError;
      }

      throw CustomException(errorMessage);
    }

    try {
      _showLoading();
      var _login = Login(email: state.mail, password: state.password);
      var _token = await ref.watch(authRepositoryProvider).logIn(login: _login);
      if (_token == null) throw CustomException('ログインに失敗しました');
      await saveTokenAndUserInfo(token: _token);
    } catch (e) {
      logger.severe('Error login' + e.toString());
      rethrow;
    } finally {
      _hideLoading();
    }
  } */

  /* Future<void> saveTokenAndUserInfo({
    required String token,
  }) async {
    await ref.watch(preferencesRepositoryProvider).saveAccessToken(token);
    var _me = await ref.watch(customersRepositoryProvider).me();
    var _userId = _me?.customer?.id;
    if (_userId != null) {
      await ref.watch(preferencesRepositoryProvider).saveUserId(_userId);
      await ref.watch(analyticsManagerProvider).setUserId(_userId);
      await Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: _userId)),
      );
    }
  } */

  Future logout() async {
    try {
      _showLoading();
      // FCMトークンを削除
      /* await ref.watch(customersRepositoryProvider).removeFcmtoken(); */
      // localDBを削除
      await ref.watch(preferencesRepositoryProvider).clear();
      // localDBにFlagを保存
      await ref.watch(preferencesRepositoryProvider).saveLoggedInFlag(true);
    } catch (e) {
      logger.severe('Error loout' + e.toString());
      // なにかしらでログアウトに失敗した場合は、localDBを削除
      await ref.watch(preferencesRepositoryProvider).clear();
      rethrow;
    } finally {
      _hideLoading();
    }
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class LoginItems with _$LoginItems {
  factory LoginItems({
    @Default("") String mail,
    @Default("") String password,
    @Default(false) bool isLoading,
  }) = _LoginItems;
}
