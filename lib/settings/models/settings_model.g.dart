// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel()
      ..env = $enumDecodeNullable(_$EnvironmentEnumMap, json['env']);

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'env': _$EnvironmentEnumMap[instance.env],
    };

const _$EnvironmentEnumMap = {
  Environment.TEST: 'TEST',
  Environment.PRODUCTION: 'PRODUCTION',
  Environment.TEST_UA: 'TEST_UA',
  Environment.PRODUCTION_UA: 'PRODUCTION_UA',
};
