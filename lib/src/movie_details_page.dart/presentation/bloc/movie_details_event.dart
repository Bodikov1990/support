part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

final class MovieDetailsGetEvent extends MovieDetailsEvent {
  final CityModel city;
  final MovieModel movieModel;
  final MovieType movieType;

  const MovieDetailsGetEvent({
    required this.city,
    required this.movieModel,
    required this.movieType,
  });

  @override
  List<Object> get props => [movieModel, movieType];
}

final class MovieDetailsSendNotificationEvent extends MovieDetailsEvent {
  final CityModel city;
  final MovieModel movieModel;
  final MovieType movieType;
  final String title;
  final String bodyText;

  const MovieDetailsSendNotificationEvent(
      {required this.city,
      required this.movieModel,
      required this.movieType,
      required this.title,
      required this.bodyText});

  @override
  List<Object> get props => [movieModel, movieType, title, bodyText];
}
