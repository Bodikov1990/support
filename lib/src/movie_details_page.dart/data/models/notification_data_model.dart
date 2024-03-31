import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';

part 'notification_data_model.g.dart';

@JsonSerializable()
class NotificationDataModel extends NotificationData {
  const NotificationDataModel(
      {required super.channelKey,
      required super.largeIcon,
      required super.bigPicture,
      required super.movieId,
      required super.type});

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotificationDataModelToJson(this);
}
