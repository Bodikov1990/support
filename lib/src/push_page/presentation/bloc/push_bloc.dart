import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';
import 'package:support/src/push_page/domain/usecases/get_movies_usecase.dart';

part 'push_event.dart';
part 'push_state.dart';

class PushBloc extends Bloc<PushEvent, PushState> {
  final GetMoviesUseCase _getMoviesUseCase = GetMoviesUseCase();
  List<MovieModel> mainMovies = [];

  PushBloc() : super(PushInitial()) {
    on<PushGetMoviesEvent>(_getMoviesEvent);
  }

  Future<void> _getMoviesEvent(
      PushGetMoviesEvent event, Emitter<PushState> emit) async {
    emit(PushGetMoviesLoadingState());
    mainMovies.clear();
    if (event.cityId == newMovies) {
      await _fetchAllMovies(event.cities, event.movieType);
    } else {
      await _fetchMoviesForCity(event.cityId, event.movieType);
    }
    _removeMovieDuplicates();
    debugPrint(mainMovies.length.toString());
    emit(PushGetMoviesSuccesState(movies: mainMovies));
  }

  Future<void> _fetchAllMovies(List<CityModel> cities, MovieType type) async {
    for (CityModel city in cities) {
      if (city.id == newMovies) continue;
      await _fetchMoviesForCity(city.id ?? '', type);
    }
  }

  Future<void> _fetchMoviesForCity(String cityId, MovieType type) async {
    final result = await _getMoviesUseCase(
        GetMoviesUseCaseParams(cityId: cityId, movieType: type));

    result.fold(
      (failure) {
        // Здесь можно обработать ошибку
      },
      (movies) {
        mainMovies.addAll(movies);
      },
    );
  }

  void _removeMovieDuplicates() {
    final uniqueMovies = <String, MovieModel>{};
    for (MovieModel movie in mainMovies) {
      uniqueMovies[movie.id ?? ''] = movie;
    }
    mainMovies = uniqueMovies.values.toList();
  }
}
