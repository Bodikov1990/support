// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationModel _$PushNotificationModelFromJson(
        Map<String, dynamic> json) =>
    PushNotificationModel(
      message: json['message'] == null
          ? null
          : MessageEntity.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PushNotificationModelToJson(
        PushNotificationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
