import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cat_sns_app/foundation/extensions/map_extension.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  factory Login({
    required String email,
    required String password,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}

extension LoginExtension on Login {
  Map<String, dynamic> createLogin() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result.tryInsert('email', email);
    result.tryInsert('password', password);
    return {'user': result};
  }
}
