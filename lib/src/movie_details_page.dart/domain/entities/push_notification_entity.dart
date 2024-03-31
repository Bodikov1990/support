import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/message_entity.dart';

part 'push_notification_entity.g.dart';

@JsonSerializable()
class PushNotification extends Equatable {
  final Message? message;

  const PushNotification({this.message});

  @override
  List<Object?> get props => [message];

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);
}
