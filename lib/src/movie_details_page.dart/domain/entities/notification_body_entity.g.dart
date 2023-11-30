// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_body_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBodyEntity _$NotificationBodyEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationBodyEntity(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$NotificationBodyEntityToJson(
        NotificationBodyEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
