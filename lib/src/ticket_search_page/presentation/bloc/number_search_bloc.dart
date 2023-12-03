import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'number_search_event.dart';
part 'number_search_state.dart';

class NumberSearchBloc extends Bloc<NumberSearchEvent, NumberSearchState> {
  NumberSearchBloc() : super(NumberSearchInitial()) {
    on<NumberSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
