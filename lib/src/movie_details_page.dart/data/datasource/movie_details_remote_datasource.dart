import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/injections/dio/push_dio.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<void> sendNotification(NotificationEntity notificationEntity);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final PushDio _pushDio = GetIt.instance<PushDio>();

  @override
  Future<void> sendNotification(NotificationEntity notificationEntity) async {
    const String url = '/fcm/send';

    final data = notificationEntity.toJson();

    try {
      debugPrint(data.toString());
      _pushDio.options.headers['Content-Type'] = 'application/json';

      Response response = await _pushDio.post(url, data: data);

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from MovieDetailsRemoteDataSourceImpl",
            statusCode: response.statusCode ?? 0);
      }
    } on APIExeption {
      rethrow;
    } catch (e) {
      debugPrint("sendNotification ${e.toString()} ");
      if (e is DioException) {
        debugPrint(
            "sendNotification ${e.message} ${e.response?.statusMessage ?? ""}");
        throw APIExeption(
            message: e.message ?? '', statusCode: e.response?.statusCode ?? 0);
      }
      throw APIExeption(message: e.toString(), statusCode: 507);
    }
  }
}
