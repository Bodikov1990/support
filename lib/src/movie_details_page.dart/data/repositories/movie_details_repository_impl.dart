import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/movie_details_page.dart/data/datasource/movie_details_remote_datasource.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_model.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';
import 'package:support/src/movie_details_page.dart/repository/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource _detailsRemoteDataSource =
      GetIt.instance<MovieDetailsRemoteDataSource>();

  @override
  ResultVoid sendNotification(NotificationModel notificationModel) async {
    final notificationEntity = NotificationEntity(
        to: notificationModel.to,
        priority: notificationModel.priority,
        contentAvailable: notificationModel.contentAvailable,
        mutableContent: notificationModel.mutableContent,
        data: notificationModel.data,
        notification: notificationModel.notification);
    try {
      await _detailsRemoteDataSource.sendNotification(notificationEntity);
      return const Right(null);
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
