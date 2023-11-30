import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_action_btn_entity.g.dart';

@JsonSerializable()
class NotificationActionBtnEntity extends Equatable {
  final String? key;
  final String? label;
  final String? actionType;
  final bool isDangerousOption;
  final bool autoDismissible;
  const NotificationActionBtnEntity({
    this.key,
    this.label,
    this.actionType,
    required this.isDangerousOption,
    required this.autoDismissible,
  });
  @override
  List<Object?> get props =>
      [key, label, actionType, isDangerousOption, autoDismissible];

  factory NotificationActionBtnEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationActionBtnEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationActionBtnEntityToJson(this);
}
