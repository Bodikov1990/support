import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_entity.g.dart';

@JsonSerializable()
class NotificationContentEntity extends Equatable {
  final String? title;
  final String? body;

  const NotificationContentEntity({this.title, this.body});

  @override
  List<Object?> get props => [title, body];

  factory NotificationContentEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationContentEntityToJson(this);
}
