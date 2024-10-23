// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) =>
    PushNotification(
      message: json['message'] == null
          ? null
          : MessageEntity.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
