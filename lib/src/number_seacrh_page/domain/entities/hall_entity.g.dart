// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HallEntity _$HallEntityFromJson(Map<String, dynamic> json) => HallEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$HallEntityToJson(HallEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'hash': instance.hash,
    };
