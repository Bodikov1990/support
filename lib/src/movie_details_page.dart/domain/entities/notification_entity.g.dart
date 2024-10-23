// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationContentEntity _$NotificationContentEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationContentEntity(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$NotificationContentEntityToJson(
        NotificationContentEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
