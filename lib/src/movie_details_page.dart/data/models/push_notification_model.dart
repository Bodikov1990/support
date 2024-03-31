import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/message_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/push_notification_entity.dart';

part 'push_notification_model.g.dart';

@JsonSerializable()
class PushNotificationModel extends PushNotification {
  const PushNotificationModel({
    required super.message,
  });

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PushNotificationModelToJson(this);
}
