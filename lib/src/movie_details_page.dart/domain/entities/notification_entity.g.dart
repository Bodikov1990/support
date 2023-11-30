// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      to: json['to'] as String?,
      priority: json['priority'] as String?,
      contentAvailable: json['content_available'] as bool,
      mutableContent: json['mutable_content'] as bool,
      notification: json['notification'] == null
          ? null
          : NotificationBodyEntity.fromJson(
              json['notification'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : NotificationDataEntity.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'to': instance.to,
      'priority': instance.priority,
      'content_available': instance.contentAvailable,
      'mutable_content': instance.mutableContent,
      'notification': instance.notification,
      'data': instance.data,
    };
