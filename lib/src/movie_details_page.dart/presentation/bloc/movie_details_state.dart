part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsGetState extends MovieDetailsState {}

final class MovieDetailsGetSuccessState extends MovieDetailsState {
  final CityModel city;
  final MovieModel movieModel;
  final MovieType movieType;

  const MovieDetailsGetSuccessState(
      {required this.city, required this.movieModel, required this.movieType});
}

final class MovieDetailsGetErrorState extends MovieDetailsState {
  final String title;
  final String content;

  const MovieDetailsGetErrorState({required this.title, required this.content});

  @override
  List<Object> get props => [title, content];
}

final class MovieDetailsSendingNotificationState extends MovieDetailsState {}

final class MovieDetailsSendNotificationSuccessState extends MovieDetailsState {
  final String title;
  final String content;

  const MovieDetailsSendNotificationSuccessState(
      {required this.title, required this.content});

  @override
  List<Object> get props => [title, content];
}

final class MovieDetailsSendNotificationErrorState extends MovieDetailsState {
  final String title;
  final String content;

  const MovieDetailsSendNotificationErrorState(
      {required this.title, required this.content});

  @override
  List<Object> get props => [title, content];
}
