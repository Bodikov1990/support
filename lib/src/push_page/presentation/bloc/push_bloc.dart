import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

part 'push_event.dart';
part 'push_state.dart';

class PushBloc extends Bloc<PushEvent, PushState> {
  PushBloc() : super(PushInitial()) {
    on<PushEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
