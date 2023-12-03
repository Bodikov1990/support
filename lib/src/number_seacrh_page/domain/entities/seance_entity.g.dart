// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeanceEntity _$SeanceEntityFromJson(Map<String, dynamic> json) => SeanceEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      timeframe: json['timeframe'] == null
          ? null
          : TimeframeEntity.fromJson(json['timeframe'] as Map<String, dynamic>),
      language: json['language'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$SeanceEntityToJson(SeanceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'timeframe': instance.timeframe,
      'language': instance.language,
      'hash': instance.hash,
    };
