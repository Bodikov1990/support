// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_content_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationContentEntity _$NotificationContentEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationContentEntity(
      id: json['id'] as int?,
      channelKey: json['channelKey'] as String?,
      displayOnForeground: json['displayOnForeground'] as bool,
      notificationLayout: json['notificationLayout'] as String?,
      largeIcon: json['largeIcon'] as String?,
      bigPicture: json['bigPicture'] as String?,
      showWhen: json['showWhen'] as bool,
      autoDismissible: json['autoDismissible'] as bool,
      wakeUpScreen: json['wakeUpScreen'] as bool,
      payload: json['payload'] == null
          ? null
          : NotificationPayloadEntity.fromJson(
              json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationContentEntityToJson(
        NotificationContentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'channelKey': instance.channelKey,
      'displayOnForeground': instance.displayOnForeground,
      'notificationLayout': instance.notificationLayout,
      'largeIcon': instance.largeIcon,
      'bigPicture': instance.bigPicture,
      'showWhen': instance.showWhen,
      'autoDismissible': instance.autoDismissible,
      'wakeUpScreen': instance.wakeUpScreen,
      'payload': instance.payload,
    };
