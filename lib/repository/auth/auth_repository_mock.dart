import 'package:cat_sns_app/model/login.dart';
import 'package:cat_sns_app/model/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  AuthRepositoryMock();

  @override
  Future<String?> signup({required Signup signup}) {
    throw UnimplementedError();
  }

  /* @override
  Future<String?> logIn({required Login login}) {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => 'aaaaaaaa');
  } */

  @override
  Future logOut() async {
    return await Future.delayed(const Duration(seconds: 1));
  }
}
