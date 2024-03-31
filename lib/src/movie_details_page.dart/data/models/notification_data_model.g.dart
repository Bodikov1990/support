// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataModel _$NotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    NotificationDataModel(
      channelKey: json['content.channelKey'] as String?,
      largeIcon: json['content.largeIcon'] as String?,
      bigPicture: json['content.bigPicture'] as String?,
      movieId: json['content.payload.movie_id'] as String?,
      type: json['content.payload.type'] as String?,
    );

Map<String, dynamic> _$NotificationDataModelToJson(
        NotificationDataModel instance) =>
    <String, dynamic>{
      'content.channelKey': instance.channelKey,
      'content.largeIcon': instance.largeIcon,
      'content.bigPicture': instance.bigPicture,
      'content.payload.movie_id': instance.movieId,
      'content.payload.type': instance.type,
    };
