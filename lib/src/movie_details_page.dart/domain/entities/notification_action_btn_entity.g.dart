// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_action_btn_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationActionBtnEntity _$NotificationActionBtnEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationActionBtnEntity(
      key: json['key'] as String?,
      label: json['label'] as String?,
      actionType: json['actionType'] as String?,
      isDangerousOption: json['isDangerousOption'] as bool,
      autoDismissible: json['autoDismissible'] as bool,
    );

Map<String, dynamic> _$NotificationActionBtnEntityToJson(
        NotificationActionBtnEntity instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'actionType': instance.actionType,
      'isDangerousOption': instance.isDangerousOption,
      'autoDismissible': instance.autoDismissible,
    };
