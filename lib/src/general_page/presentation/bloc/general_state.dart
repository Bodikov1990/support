part of 'general_bloc.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

final class GeneralInitial extends GeneralState {}

class GeneralGetCitiesLoadingState extends GeneralState {}

class GeneralGetCitiesLoadedState extends GeneralState {
  final List<CityModel> cities;

  const GeneralGetCitiesLoadedState({required this.cities});

  @override
  List<Object> get props => [cities.map((e) => e.id).toList()];
}
