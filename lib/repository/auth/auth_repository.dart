import 'package:cat_sns_app/data/service/auth_data_source.dart';
import 'package:cat_sns_app/model/login.dart';
import 'package:cat_sns_app/model/signup.dart';
import 'package:cat_sns_app/repository/auth/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var authRepositoryProvider = Provider<AuthRepository>(
  (ref) =>
      AuthRepositoryImpl(authDataSource: ref.watch(authDataSourceProvider)),
);

abstract class AuthRepository {
  AuthRepository();

  Future<String?> signup({required Signup signup});
  //Future<String?> logIn({required Login login});
  Future logOut();
}
