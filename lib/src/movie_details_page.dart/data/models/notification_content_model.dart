import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

part 'notification_content_model.g.dart';

@JsonSerializable()
class NotificationContentModel extends NotificationContent {
  const NotificationContentModel({required super.title, required super.body});

  factory NotificationContentModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotificationContentModelToJson(this);
}
