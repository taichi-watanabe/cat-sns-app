import 'package:cat_sns_app/model/signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<AuthDataSource> userDataSourceProvider =
    Provider<AuthDataSource>((ref) => AuthDataSource());

class AuthDataSource {
  final supabase = Supabase.instance.client;

  /* Future<String?> logIn({required Login login}) async {
    return await _dio
        .post<Map<String, dynamic>>('/customers/login',
            data: login.createLogin())
        .then((value) {
      if (value.data == null) return null;
      String? _token = value.data!.tryAt<String?>('token', null);
      return _token;
    });
  } */

  /* Future logOut() async {
    return await _dio
        .delete('/customers/logout')
        .then((value) => logger.info('Success Logout'));
  } */

  /* Future<User?> signup({required Signup signup}) async {
    return await supabase
        .post<Map<String, dynamic>>('/signup', data: signup.toJson())
        .then((value) => CustomerProfile.fromForNull(value.data));
  } */
}
