import 'package:cat_sns_app/foundation/constant/strings.dart';
import 'package:cat_sns_app/foundation/utils/logger.dart';
import 'package:cat_sns_app/model/signup.dart';
import 'package:cat_sns_app/repository/auth/auth_repository.dart';
import 'package:cat_sns_app/repository/preferences/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_notifier.freezed.dart';
part 'registration_notifier.g.dart';

@riverpod
class RegistrationNotifier extends _$RegistrationNotifier {
  @override
  RegistrationItems build() {
    return RegistrationItems();
  }

  Future requestSignup() async {
    try {
      showLoading();
      var _signup = Signup(
          name: state.name, email: state.mailAddress, password: state.password);
      var _userId =
          await ref.watch(authRepositoryProvider).signup(signup: _signup);
      print(_userId);
      await ref.watch(preferencesRepositoryProvider).saveUserId(_userId ?? '');
    } catch (e) {
      logger.severe('Error requestSignup' + e.toString());
      rethrow;
    } finally {
      hideLoading();
    }
  }
  /*
  Future requestRegisterUser() async {
    try {
      var _custormerProfile = CustomerProfile(
        customer: Customer(
          familyName: state.familyName,
          givenName: state.givenName,
          familyKana: state.familyKana,
          givenKana: state.givenKana,
        ),
        profile: Profile(
            zip: state.zipCode,
            prefectureId: state.prefectures,
            cityAddress: state.address,
            otherAddress: state.buildingName,
            tel: state.phoneNumber.toString(),
            sex: state.genderType,
            birthday: state.birthday),
      );
      await ref
          .watch(customersRepositoryProvider)
          .registerCustomerProfile(_custormerProfile);
    } catch (e) {
      logger.severe('Error requestRegisterProfile' + e.toString());
      rethrow;
    }
  }


  Future updateUser() async {
    try {
      showLoading();
      var _custormer = Customer(
        email: state.mailAddress,
      );
      await ref.watch(customersRepositoryProvider).updateCustomer(_custormer);
    } catch (e) {
      logger.severe('Error updateCustomer' + e.toString());
      rethrow;
    } finally {
      hideLoading();
    }
  }

  Future updateUserProfile() async {
    try {
      showLoading();
      var _custormerProfile = CustomerProfile(
        customer: Customer(
          familyName: state.familyName,
          givenName: state.givenName,
          familyKana: state.familyKana,
          givenKana: state.givenKana,
        ),
        profile: Profile(
            zip: state.zipCode,
            prefectureId: state.prefectures,
            cityAddress: state.address,
            otherAddress: state.buildingName,
            tel: state.phoneNumber.toString(),
            sex: state.genderType,
            birthday: state.birthday),
      );
      await ref
          .watch(customersRepositoryProvider)
          .updateCustomerProfile(_custormerProfile);
    } catch (e) {
      logger.severe('Error updateCustomerProfile' + e.toString());
      rethrow;
    } finally {
      hideLoading();
    }
  } */

  void setName(String value) {
    state = state.copyWith(name: value);
    checkSignupPageButton();
  }

  void setMailAddress(String value) {
    state = state.copyWith(mailAddress: value);
    checkSignupPageButton();
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
    checkSignupPageButton();
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
    checkSignupPageButton();
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.nameEmptyMessage;
    }
    return null;
  }

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

  String? confirmPassValidator(String? value) {
    RegExp regExp = RegExp(Strings.pwdPattern);
    if (value == null || value.isEmpty) {
      return Strings.passEmptyMessage;
    } else if (!regExp.hasMatch(value)) {
      return Strings.passValidateMessage;
    } else if (value != state.password) {
      return Strings.passNotMatchMessage;
    }
    return null;
  }

  void checkSignupPageButton() => state = state.copyWith(
      checkSignupPageButton: (nameValidator(state.name) == null &&
          mailValidator(state.mailAddress) == null &&
          passValidator(state.password) == null &&
          confirmPassValidator(state.confirmPassword) == null));

  void showLoading() => state = state.copyWith(isLoading: true);
  void hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class RegistrationItems with _$RegistrationItems {
  factory RegistrationItems({
    @Default("") String name,
    @Default("") String mailAddress,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default(false) bool checkSignupPageButton,
    @Default(false) bool isLoading,
  }) = _RegistrationItems;
}
