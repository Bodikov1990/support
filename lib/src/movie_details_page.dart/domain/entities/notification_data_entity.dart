import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_action_btn_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_content_entity.dart';

part 'notification_data_entity.g.dart';

@JsonSerializable()
class NotificationDataEntity extends Equatable {
  final NotificationContentEntity? content;
  final List<NotificationActionBtnEntity>? actionButtons;
  const NotificationDataEntity({
    this.content,
    this.actionButtons,
  });

  @override
  List<Object?> get props => [content, actionButtons];

  factory NotificationDataEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataEntityToJson(this);
}
