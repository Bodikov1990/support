// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeframe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeframeEntity _$TimeframeEntityFromJson(Map<String, dynamic> json) =>
    TimeframeEntity(
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$TimeframeEntityToJson(TimeframeEntity instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
