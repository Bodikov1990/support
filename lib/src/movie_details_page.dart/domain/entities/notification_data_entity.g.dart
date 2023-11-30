// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataEntity _$NotificationDataEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationDataEntity(
      content: json['content'] == null
          ? null
          : NotificationContentEntity.fromJson(
              json['content'] as Map<String, dynamic>),
      actionButtons: (json['actionButtons'] as List<dynamic>?)
          ?.map((e) =>
              NotificationActionBtnEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationDataEntityToJson(
        NotificationDataEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'actionButtons': instance.actionButtons,
    };
