import 'package:cat_sns_app/foundation/constant/strings.dart';
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

  /* Future requestSignup() async {
    try {
      showLoading();
      var _signup = Signup(
          email: state.mailAddress,
          password: state.password,
          passwordConfirmation: state.confirmPassword);
      var _customer =
          await ref.watch(authRepositoryProvider).signup(signup: _signup);
      await ref
          .watch(preferencesRepositoryProvider)
          .saveAccessToken(_customer?.token ?? '');
    } catch (e) {
      logger.severe('Error requestSignup' + e.toString());
      rethrow;
    } finally {
      hideLoading();
    }
  }

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

  void setMailAddress(String value) {
    state = state.copyWith(mailAddress: value);
    checkEmailPageButton();
  }

  void setEditMailAddress(String value) {
    state = state.copyWith(mailAddress: value);
    checkEditEmailPageButton();
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
    checkEmailPageButton();
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
    checkEmailPageButton();
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

  void checkEditEmailPageButton() => state = state.copyWith(
      checkEditEmailPageButton: mailValidator(state.mailAddress) == null);

  void checkEmailPageButton() => state = state.copyWith(
      checkEmailPageButton: (mailValidator(state.mailAddress) == null &&
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
    @Default(false) bool checkEmailPageButton,
    @Default(false) bool checkEditEmailPageButton,
    @Default(false) bool checkNamePageButton,
    @Default(false) bool isLoading,
  }) = _RegistrationItems;
}
