import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:support/main.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {
  Environment? env;

  SettingsModel() {
    env = DEFAULT_ENV;
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  factory SettingsModel.fromJsonString(String jsonString) =>
      SettingsModel.fromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  String toJsonString() => jsonEncode(toJson());
}
