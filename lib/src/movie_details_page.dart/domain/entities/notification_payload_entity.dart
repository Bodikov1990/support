import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_payload_entity.g.dart';

@JsonSerializable()
class NotificationPayloadEntity extends Equatable {
  @JsonKey(name: 'movie_id')
  final String? movieId;
  final String? type;
  const NotificationPayloadEntity({
    this.movieId,
    this.type,
  });
  @override
  List<Object?> get props => [movieId, type];

  factory NotificationPayloadEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPayloadEntityToJson(this);
}
