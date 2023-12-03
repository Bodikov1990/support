import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/utils/date_time_utils.dart';
import 'package:support/src/push_page/domain/entities/movie_entity.dart';

abstract class AllMoviesRemoteDataSource {
  Future<List<MovieEntity>> getMovies(String cityId, MovieType type);
}

class AllMoviesRemoteDataSourceImpl implements AllMoviesRemoteDataSource {
  final Dio _dio = GetIt.instance<Dio>();

  @override
  Future<List<MovieEntity>> getMovies(String cityId, MovieType type) async {
    String url;
    Map<String, String> queryParameters = {
      PARAM_CITY: cityId,
    };

    switch (type) {
      case MovieType.TODAY:
        url = "/api/movie/today";
        queryParameters[PARAM_START] = today();
        break;

      case MovieType.SOON:
        url = "/api/movie/soon";
        queryParameters[PARAM_RELEASE_DATE] = tomorrow();
        break;

      case MovieType.PRE_SALE:
        url = "/api/movie/presale";
        queryParameters[PARAM_CITY] = cityId;
        queryParameters[PARAM_RELEASE_DATE] = tomorrow();
        break;

      default:
        url = "/api/movie/today";
        break;
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      if (response.data["data"] == null) {
        return [];
      }

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from PushRemoteDataSourceImpl",
            statusCode: response.statusCode ?? 0);
      } else {
        return (response.data["data"] as List<dynamic>)
            .map((raw) => MovieEntity.fromJson(raw))
            .toList();
      }
    } on APIExeption {
      rethrow;
    } catch (e) {
      debugPrint("getMovies ${e.toString()} ");
      if (e is DioException) {
        debugPrint("getMovies ${e.message} ${e.response?.statusMessage ?? ""}");
        throw APIExeption(
            message: e.message ?? '', statusCode: e.response?.statusCode ?? 0);
      }
      throw APIExeption(message: e.toString(), statusCode: 507);
    }
  }
}
