import 'package:support/core/utils/typedef.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/push_notification_entity.dart';

abstract class PushRepository {
  ResultVoid sendNotification(PushNotification pushNotification);
}
