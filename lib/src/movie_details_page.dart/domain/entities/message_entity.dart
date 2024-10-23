import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/android_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/apns_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

part 'message_entity.g.dart';

@JsonSerializable()
class MessageEntity extends Equatable {
  final String? topic;
  final AndroidEntity? android;
  final ApnsEntity? apns;
  final NotificationContentEntity? notification;
  final NotificationDataEntity? data;

  const MessageEntity({
    this.topic,
    this.android = const AndroidEntity(),
    this.apns = const ApnsEntity(),
    this.notification,
    this.data,
  });

  @override
  List<Object?> get props => [topic, android, apns, notification, data];

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
