import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_data_entity.g.dart';

@JsonSerializable()
class NotificationDataEntity extends Equatable {
  @JsonKey(name: "content.id")
  final String? contentId;
  @JsonKey(name: "content.channelKey")
  final String? channelKey;
  @JsonKey(name: "content.displayOnForeground")
  final String? displayOnForeground;
  @JsonKey(name: "content.notificationLayout")
  final String? notificationLayout;
  @JsonKey(name: "content.largeIcon")
  final String? largeIcon;
  @JsonKey(name: "content.bigPicture")
  final String? bigPicture;
  @JsonKey(name: "content.showWhen")
  final String? showWhen;
  @JsonKey(name: "content.autoDismissible")
  final String? autoDismissible;
  @JsonKey(name: "content.payload.movie_id")
  final String? movieId;
  @JsonKey(name: "content.payload.type")
  final String? type;
  @JsonKey(name: "actionButtons.1.key")
  final String? actionButtonKey;
  @JsonKey(name: "actionButtons.1.label")
  final String? actionButtonLabel;
  @JsonKey(name: "actionButtons.1.actionType")
  final String? actionButtonType;
  @JsonKey(name: "actionButtons.1.isDangerousOption")
  final String? actionButtonOption;
  @JsonKey(name: "actionButtons.1.autoDismissible")
  final String? actionButtonAutoDismiss;

  const NotificationDataEntity(
      {this.contentId,
      this.channelKey,
      this.displayOnForeground = 'true',
      this.notificationLayout = "BigPicture",
      this.largeIcon,
      this.bigPicture,
      this.showWhen = 'true',
      this.autoDismissible = 'true',
      this.movieId,
      this.type,
      this.actionButtonKey = "DISMISS",
      this.actionButtonLabel = "Закрыть",
      this.actionButtonType = "DismissAction",
      this.actionButtonOption = "true",
      this.actionButtonAutoDismiss = "false"});

  @override
  List<Object?> get props => [
        contentId,
        channelKey,
        displayOnForeground,
        notificationLayout,
        largeIcon,
        bigPicture,
        showWhen,
        autoDismissible,
        movieId,
        type,
        actionButtonKey,
        actionButtonLabel,
        actionButtonType,
        actionButtonOption,
        actionButtonAutoDismiss
      ];

  factory NotificationDataEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataEntityToJson(this);
}
