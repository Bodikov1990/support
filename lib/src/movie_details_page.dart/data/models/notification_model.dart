import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel(
      {required super.to,
      required super.priority,
      required super.notification,
      required super.contentAvailable,
      required super.mutableContent,
      required super.data});
}
