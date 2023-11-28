import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? login;
  String? password;
  String? baseURL;
  String? prefix;
  String? accessToken;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromJsonString(String jsonString) =>
      UserModel.fromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String toJsonString() => jsonEncode(toJson());
}
