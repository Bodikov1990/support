import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_entity.g.dart';

@JsonSerializable()
class NotificationContent extends Equatable {
  final String? title;
  final String? body;

  const NotificationContent({this.title, this.body});

  @override
  List<Object?> get props => [title, body];

  factory NotificationContent.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationContentToJson(this);
}
