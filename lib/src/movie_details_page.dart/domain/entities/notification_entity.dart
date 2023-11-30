// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_body_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';

part 'notification_entity.g.dart';

@JsonSerializable()
class NotificationEntity extends Equatable {
  final String? to;
  final String? priority;
  @JsonKey(name: 'content_available')
  final bool contentAvailable;
  @JsonKey(name: 'mutable_content')
  final bool mutableContent;
  final NotificationBodyEntity? notification;
  final NotificationDataEntity? data;
  const NotificationEntity({
    this.to,
    this.priority,
    required this.contentAvailable,
    required this.mutableContent,
    required this.notification,
    this.data,
  });

  @override
  List<Object?> get props =>
      [to, priority, contentAvailable, mutableContent, notification, data];

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}
