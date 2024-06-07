import 'package:cat_sns_app/data/service/auth_data_source.dart';
import 'package:cat_sns_app/model/login.dart';
import 'package:cat_sns_app/model/signup.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;
  final AuthDataSource _authDataSource;

  @override
  Future<String?> logIn({required Login login}) async {
    return await _authDataSource.logIn(login: login);
  }

  @override
  Future logOut() async {
    return await _authDataSource.logOut();
  }

  @override
  Future<String?> signup({required Signup signup}) async {
    return await _authDataSource.signup(signup: signup);
  }
}
