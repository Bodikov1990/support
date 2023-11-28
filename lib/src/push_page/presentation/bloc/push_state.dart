part of 'push_bloc.dart';

abstract class PushState extends Equatable {
  const PushState();

  @override
  List<Object> get props => [];
}

final class PushInitial extends PushState {}

final class PushGetMoviesLoadingState extends PushState {}

final class PushGetMoviesSuccesState extends PushState {
  final List<MovieModel> movies;

  const PushGetMoviesSuccesState({required this.movies});

  @override
  List<Object> get props => [movies.map((e) => e.id ?? '').toList()];
}
