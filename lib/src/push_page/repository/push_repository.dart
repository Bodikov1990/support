import 'package:support/core/utils/constants.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

abstract class PushRepository {
  ResultFuture<List<MovieModel>> getMovies(
      {required String cityId, required MovieType type});
}
