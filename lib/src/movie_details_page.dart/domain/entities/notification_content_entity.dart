// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:support/src/movie_details_page.dart/domain/entities/notification_payload_entity.dart';

part 'notification_content_entity.g.dart';

@JsonSerializable()
class NotificationContentEntity extends Equatable {
  final int? id;
  final String? channelKey;
  final bool displayOnForeground;
  final String? notificationLayout;
  final String? largeIcon;
  final String? bigPicture;
  final bool showWhen;
  final bool autoDismissible;
  final bool wakeUpScreen;
  final NotificationPayloadEntity? payload;
  const NotificationContentEntity({
    this.id,
    this.channelKey,
    required this.displayOnForeground,
    this.notificationLayout,
    this.largeIcon,
    this.bigPicture,
    required this.showWhen,
    required this.autoDismissible,
    required this.wakeUpScreen,
    this.payload,
  });

  @override
  List<Object?> get props => [
        id,
        channelKey,
        displayOnForeground,
        notificationLayout,
        largeIcon,
        bigPicture,
        showWhen,
        autoDismissible,
        wakeUpScreen,
        payload
      ];

  factory NotificationContentEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationContentEntityToJson(this);
}
