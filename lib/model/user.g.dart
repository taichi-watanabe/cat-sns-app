// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordComfirm: json['passwordComfirm'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'email': instance.email,
      'password': instance.password,
      'passwordComfirm': instance.passwordComfirm,
      'createdAt': instance.createdAt,
    };
