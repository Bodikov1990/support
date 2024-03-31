// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';

import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/push_notification_entity.dart';
import 'package:support/src/movie_details_page.dart/repository/push_repository.dart';

class SendNotificationUseCase
    extends UsecaseWithParams<void, SendNotificationUseCaseParams> {
  final PushRepository _movieDetailsRepository =
      GetIt.instance<PushRepository>();
  @override
  ResultFuture<void> call(SendNotificationUseCaseParams params) async =>
      _movieDetailsRepository.sendNotification(params.pushNotification);
}

class SendNotificationUseCaseParams {
  final PushNotification pushNotification;
  SendNotificationUseCaseParams({
    required this.pushNotification,
  });
}
