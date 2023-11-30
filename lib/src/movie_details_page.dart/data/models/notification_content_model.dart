import 'package:support/src/movie_details_page.dart/domain/entities/notification_content_entity.dart';

class NotificationContentModel extends NotificationContentEntity {
  const NotificationContentModel(
      {required super.id,
      required super.channelKey,
      required super.notificationLayout,
      required super.largeIcon,
      required super.bigPicture,
      required super.showWhen,
      required super.autoDismissible,
      required super.displayOnForeground,
      required super.wakeUpScreen,
      required super.payload});
}
