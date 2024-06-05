import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';
part 'signup.g.dart';

@freezed
class Signup with _$Signup {
  factory Signup({
    required String name,
    required String email,
    required String password,
    String? passwordConfirmation,
  }) = _Signup;

  factory Signup.fromJson(Map<String, dynamic> json) => _$SignupFromJson(json);
}
