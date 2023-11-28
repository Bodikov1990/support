import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/src/general_page/domain/entities/city_entity.dart';

abstract class GeneralRemoteDataSource {
  Future<List<CityEntity>> getCities();
}

class GeneralRemoteDataSourceImpl implements GeneralRemoteDataSource {
  final Dio _dio = GetIt.instance<Dio>();

  @override
  Future<List<CityEntity>> getCities() async {
    try {
      Response response = await _dio.get(
        '/api/city',
      );

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from GeneralRemoteDataSourceImpl",
            statusCode: response.statusCode ?? 0);
      }

      return (response.data["data"] as List<dynamic>)
          .map((raw) => CityEntity.fromJson(raw))
          .toList();
    } on APIExeption {
      rethrow;
    } catch (e) {
      debugPrint("getCities ${e.toString()} ");
      if (e is DioException) {
        debugPrint("${e.message} ${e.response?.statusMessage ?? ""}");

        throw APIExeption(
            message: e.message ?? "Opps",
            statusCode: e.response?.statusCode ?? 506);
      }
      throw APIExeption(message: e.toString(), statusCode: 507);
    }
  }
}
