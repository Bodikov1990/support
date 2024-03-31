// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      aps: json['aps'] == null
          ? const Aps()
          : Aps.fromJson(json['aps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'aps': instance.aps,
    };
