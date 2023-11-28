// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';

import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';
import 'package:support/src/push_page/repository/push_repository.dart';

class GetMoviesUseCase
    extends UsecaseWithParams<List<MovieModel>, GetMoviesUseCaseParams> {
  final PushRepository _pushRepository = GetIt.instance<PushRepository>();

  @override
  ResultFuture<List<MovieModel>> call(GetMoviesUseCaseParams params) async =>
      _pushRepository.getMovies(cityId: params.cityId, type: params.movieType);
}

class GetMoviesUseCaseParams {
  final String cityId;
  final MovieType movieType;

  GetMoviesUseCaseParams({
    required this.cityId,
    required this.movieType,
  });
}
