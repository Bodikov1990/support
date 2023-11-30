import 'package:support/core/utils/typedef.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_model.dart';

abstract class MovieDetailsRepository {
  ResultVoid sendNotification(NotificationModel notificationModel);
}
