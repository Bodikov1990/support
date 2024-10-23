// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apns_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApnsEntity _$ApnsEntityFromJson(Map<String, dynamic> json) => ApnsEntity(
      payload: json['payload'] == null
          ? const Payload()
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {"apns-priority": "10"},
    );

Map<String, dynamic> _$ApnsEntityToJson(ApnsEntity instance) =>
    <String, dynamic>{
      'payload': instance.payload,
      'headers': instance.headers,
    };
