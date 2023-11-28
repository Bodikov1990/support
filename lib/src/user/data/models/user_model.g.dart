// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..login = json['login'] as String?
  ..password = json['password'] as String?
  ..baseURL = json['baseURL'] as String?
  ..prefix = json['prefix'] as String?
  ..accessToken = json['accessToken'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'baseURL': instance.baseURL,
      'prefix': instance.prefix,
      'accessToken': instance.accessToken,
    };
