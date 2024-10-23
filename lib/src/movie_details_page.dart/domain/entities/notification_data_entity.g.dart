// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataEntity _$NotificationDataEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationDataEntity(
      contentId: json['content.id'] as String?,
      channelKey: json['content.channelKey'] as String?,
      displayOnForeground:
          json['content.displayOnForeground'] as String? ?? 'true',
      notificationLayout:
          json['content.notificationLayout'] as String? ?? "BigPicture",
      largeIcon: json['content.largeIcon'] as String?,
      bigPicture: json['content.bigPicture'] as String?,
      showWhen: json['content.showWhen'] as String? ?? 'true',
      autoDismissible: json['content.autoDismissible'] as String? ?? 'true',
      movieId: json['content.payload.movie_id'] as String?,
      type: json['content.payload.type'] as String?,
      actionButtonKey: json['actionButtons.1.key'] as String? ?? "DISMISS",
      actionButtonLabel: json['actionButtons.1.label'] as String? ?? "Закрыть",
      actionButtonType:
          json['actionButtons.1.actionType'] as String? ?? "DismissAction",
      actionButtonOption:
          json['actionButtons.1.isDangerousOption'] as String? ?? "true",
      actionButtonAutoDismiss:
          json['actionButtons.1.autoDismissible'] as String? ?? "false",
    );

Map<String, dynamic> _$NotificationDataEntityToJson(
        NotificationDataEntity instance) =>
    <String, dynamic>{
      'content.id': instance.contentId,
      'content.channelKey': instance.channelKey,
      'content.displayOnForeground': instance.displayOnForeground,
      'content.notificationLayout': instance.notificationLayout,
      'content.largeIcon': instance.largeIcon,
      'content.bigPicture': instance.bigPicture,
      'content.showWhen': instance.showWhen,
      'content.autoDismissible': instance.autoDismissible,
      'content.payload.movie_id': instance.movieId,
      'content.payload.type': instance.type,
      'actionButtons.1.key': instance.actionButtonKey,
      'actionButtons.1.label': instance.actionButtonLabel,
      'actionButtons.1.actionType': instance.actionButtonType,
      'actionButtons.1.isDangerousOption': instance.actionButtonOption,
      'actionButtons.1.autoDismissible': instance.actionButtonAutoDismiss,
    };
