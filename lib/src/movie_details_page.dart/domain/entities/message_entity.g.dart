// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      topic: json['topic'] as String?,
      android: json['android'] == null
          ? null
          : Android.fromJson(json['android'] as Map<String, dynamic>),
      apns: json['apns'] == null
          ? null
          : Apns.fromJson(json['apns'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : NotificationContent.fromJson(
              json['notification'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'topic': instance.topic,
      'android': instance.android,
      'apns': instance.apns,
      'notification': instance.notification,
      'data': instance.data,
    };
