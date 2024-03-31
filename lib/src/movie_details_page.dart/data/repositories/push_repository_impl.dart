import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/movie_details_page.dart/data/datasource/push_remote_datasource.dart';
import 'package:support/src/movie_details_page.dart/data/models/push_notification_model.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/push_notification_entity.dart';

import 'package:support/src/movie_details_page.dart/repository/push_repository.dart';

class PushRepositoryImpl implements PushRepository {
  final PushRemoteDataSource _detailsRemoteDataSource =
      GetIt.instance<PushRemoteDataSource>();

  @override
  ResultVoid sendNotification(PushNotification pushNotification) async {
    final pushNotificationModel =
        PushNotificationModel(message: pushNotification.message);

    try {
      await _detailsRemoteDataSource.sendNotification(pushNotificationModel);
      return const Right(null);
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
