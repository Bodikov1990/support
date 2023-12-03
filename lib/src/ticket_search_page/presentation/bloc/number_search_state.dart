part of 'number_search_bloc.dart';

sealed class NumberSearchState extends Equatable {
  const NumberSearchState();
  
  @override
  List<Object> get props => [];
}

final class NumberSearchInitial extends NumberSearchState {}
