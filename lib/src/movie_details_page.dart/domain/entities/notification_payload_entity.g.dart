// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPayloadEntity _$NotificationPayloadEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationPayloadEntity(
      movieId: json['movie_id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NotificationPayloadEntityToJson(
        NotificationPayloadEntity instance) =>
    <String, dynamic>{
      'movie_id': instance.movieId,
      'type': instance.type,
    };
