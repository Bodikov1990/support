// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      topic: json['topic'] as String?,
      android: json['android'] == null
          ? const AndroidEntity()
          : AndroidEntity.fromJson(json['android'] as Map<String, dynamic>),
      apns: json['apns'] == null
          ? const ApnsEntity()
          : ApnsEntity.fromJson(json['apns'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : NotificationContentEntity.fromJson(
              json['notification'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : NotificationDataEntity.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'android': instance.android,
      'apns': instance.apns,
      'notification': instance.notification,
      'data': instance.data,
    };
