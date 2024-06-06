// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginItems {
  String get mail => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginItemsCopyWith<LoginItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginItemsCopyWith<$Res> {
  factory $LoginItemsCopyWith(
          LoginItems value, $Res Function(LoginItems) then) =
      _$LoginItemsCopyWithImpl<$Res, LoginItems>;
  @useResult
  $Res call({String mail, String password, bool isLoading});
}

/// @nodoc
class _$LoginItemsCopyWithImpl<$Res, $Val extends LoginItems>
    implements $LoginItemsCopyWith<$Res> {
  _$LoginItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mail = null,
    Object? password = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginItemsImplCopyWith<$Res>
    implements $LoginItemsCopyWith<$Res> {
  factory _$$LoginItemsImplCopyWith(
          _$LoginItemsImpl value, $Res Function(_$LoginItemsImpl) then) =
      __$$LoginItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mail, String password, bool isLoading});
}

/// @nodoc
class __$$LoginItemsImplCopyWithImpl<$Res>
    extends _$LoginItemsCopyWithImpl<$Res, _$LoginItemsImpl>
    implements _$$LoginItemsImplCopyWith<$Res> {
  __$$LoginItemsImplCopyWithImpl(
      _$LoginItemsImpl _value, $Res Function(_$LoginItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mail = null,
    Object? password = null,
    Object? isLoading = null,
  }) {
    return _then(_$LoginItemsImpl(
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginItemsImpl implements _LoginItems {
  _$LoginItemsImpl(
      {this.mail = "", this.password = "", this.isLoading = false});

  @override
  @JsonKey()
  final String mail;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'LoginItems(mail: $mail, password: $password, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginItemsImpl &&
            (identical(other.mail, mail) || other.mail == mail) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mail, password, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginItemsImplCopyWith<_$LoginItemsImpl> get copyWith =>
      __$$LoginItemsImplCopyWithImpl<_$LoginItemsImpl>(this, _$identity);
}

abstract class _LoginItems implements LoginItems {
  factory _LoginItems(
      {final String mail,
      final String password,
      final bool isLoading}) = _$LoginItemsImpl;

  @override
  String get mail;
  @override
  String get password;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$LoginItemsImplCopyWith<_$LoginItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
