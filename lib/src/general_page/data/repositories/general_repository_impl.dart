import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/general_page/data/datasource/general_remote_datasource.dart';
import 'package:support/src/general_page/data/models/city_model.dart';

import 'package:support/src/general_page/repository/general_repository.dart';

class GeneralRepositoryImpl implements GeneralRepository {
  final GeneralRemoteDataSource _dataSource =
      GetIt.instance<GeneralRemoteDataSource>();

  @override
  ResultFuture<List<CityModel>> getCities() async {
    try {
      final result = await _dataSource.getCities();

      return Right(result
          .map((city) => CityModel(
              id: city.id,
              name: city.name,
              code: city.code,
              sortOrder: city.sortOrder))
          .toList());
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
