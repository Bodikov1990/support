import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_body_entity.g.dart';

@JsonSerializable()
class NotificationBodyEntity extends Equatable {
  final String? title;
  final String? body;
  const NotificationBodyEntity({
    this.title,
    this.body,
  });
  @override
  List<Object?> get props => [title, body];

  factory NotificationBodyEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyEntityToJson(this);
}
