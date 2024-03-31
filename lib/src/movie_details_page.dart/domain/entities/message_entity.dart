import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/android_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/apns_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

part 'message_entity.g.dart';

@JsonSerializable()
class Message extends Equatable {
  final String? topic;
  final Android? android;
  final Apns? apns;
  final NotificationContent? notification;
  final NotificationData? data;

  const Message({
    this.topic,
    this.android = const Android(),
    this.apns = const Apns(),
    this.notification,
    this.data,
  });

  @override
  List<Object?> get props => [topic, android, apns, notification, data];

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
