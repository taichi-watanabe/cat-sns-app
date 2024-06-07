import 'package:cat_sns_app/foundation/utils/logger.dart';
import 'package:cat_sns_app/model/login.dart';
import 'package:cat_sns_app/model/signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<AuthDataSource> authDataSourceProvider =
    Provider<AuthDataSource>((ref) => AuthDataSource());

class AuthDataSource {
  final supabase = Supabase.instance.client;

  Future<String?> logIn({required Login login}) async {
    return await supabase.auth
        .signInWithPassword(email: login.email, password: login.password)
        .then((value) {
      if (value.user!.id.isEmpty) return null;
      String? uid = value.user!.id;
      return uid;
    });
  }

  Future logOut() async {
    return supabase.auth
        .signOut()
        .then((value) => logger.info('Success Logout'));
  }

  Future<String?> signup({required Signup signup}) async {
    return await supabase.auth.signUp(
        email: signup.email,
        password: signup.password,
        data: {'name': signup.name}).then((value) => value.user!.id);
  }
}
