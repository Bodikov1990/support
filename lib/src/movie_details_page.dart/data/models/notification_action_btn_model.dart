import 'package:support/src/movie_details_page.dart/domain/entities/notification_action_btn_entity.dart';

class NotifiationActionBtnModel extends NotificationActionBtnEntity {
  const NotifiationActionBtnModel(
      {required super.key,
      required super.actionType,
      required super.label,
      required super.isDangerousOption,
      required super.autoDismissible});
}
