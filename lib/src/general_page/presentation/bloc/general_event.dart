part of 'general_bloc.dart';

abstract class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

class GeneralGetCitiesLoadingEvent extends GeneralEvent {}
