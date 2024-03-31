import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/utils/access_token.dart';
import 'package:support/injections/dio/push_dio.dart';
import 'package:support/src/movie_details_page.dart/data/models/push_notification_model.dart';

abstract class PushRemoteDataSource {
  Future<void> sendNotification(PushNotificationModel pushNotificationModel);
}

class PushRemoteDataSourceImpl implements PushRemoteDataSource {
  final PushDio _pushDio = GetIt.instance<PushDio>();
  AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();

  @override
  Future<void> sendNotification(
      PushNotificationModel pushNotificationModel) async {
    const String url = '/v1/projects/kinopark-kinoplexx-kz/messages:send';

    final data = pushNotificationModel.toJson();
    try {
      String token = await accessFirebaseToken.getAccessToken();

      _pushDio.options.headers['Authorization'] = "Bearer $token";
      _pushDio.options.headers['Content-Type'] = 'application/json';

      Response response = await _pushDio.post(url, data: data);

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from PushRemoteDataSourceImpl",
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
