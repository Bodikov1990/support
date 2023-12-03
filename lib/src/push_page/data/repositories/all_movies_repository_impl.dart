import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/push_page/data/datasources/all_movies_remote_datasource.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';
import 'package:support/src/push_page/repository/all_movies_repository.dart';

class AllMoviesRepositoryImpl implements AllMoviesRepository {
  final AllMoviesRemoteDataSource _dataSource =
      GetIt.instance<AllMoviesRemoteDataSource>();

  @override
  ResultFuture<List<MovieModel>> getMovies(
      {required String cityId, required MovieType type}) async {
    try {
      final result = await _dataSource.getMovies(cityId, type);

      return Right(result
          .map((movie) => MovieModel(
              id: movie.id,
              name: movie.name,
              genres: movie.genres,
              code: movie.code,
              actors: movie.actors,
              description: movie.description,
              directors: movie.directors,
              certification: movie.certification,
              image: movie.image,
              duration: movie.duration,
              releaseDate: movie.releaseDate))
          .toList());
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
