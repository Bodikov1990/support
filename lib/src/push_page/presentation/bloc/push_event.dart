// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'push_bloc.dart';

abstract class PushEvent extends Equatable {
  const PushEvent();

  @override
  List<Object> get props => [];
}

class PushGetMoviesEvent extends PushEvent {
  final String cityId;
  final List<CityModel> cities;
  final MovieType movieType;

  const PushGetMoviesEvent({
    required this.cityId,
    required this.cities,
    required this.movieType,
  });

  @override
  List<Object> get props =>
      [cityId, cities.map((e) => e.id).toList(), movieType];
}
