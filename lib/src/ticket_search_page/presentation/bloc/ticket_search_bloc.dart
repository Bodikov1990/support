import 'package:bloc/bloc.dart';
import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';
import 'package:support/src/ticket_search_page/domain/usecases/get_ticket_usecase.dart';

part 'ticket_search_event.dart';
part 'ticket_search_state.dart';

class TicketSearchBloc extends Bloc<TicketSearchEvent, TicketSearchState> {
  final GetTicketUseCase _getTicketUseCase = GetTicketUseCase();

  TicketSearchBloc() : super(TicketSearchInitial()) {
    on<TicketGetTicketIdEvent>(getTicketById);
    on<TicketGetTicketNumberEvent>(getTicketByNumber);
  }

  Future<void> getTicketById(
      TicketGetTicketIdEvent event, Emitter<TicketSearchState> emit) async {
    emit(TicketLoadingState());

    final result =
        await _getTicketUseCase(GetTicketUseCaseParams(byId: event.id));

    result.fold(
        (failure) => emit(TicketLoadingErrorState(
            title: 'Ошибка!',
            message: 'Заказ с таким Id ${event.id} не найдено"')),
        (ticket) => emit(TicketLoadedState(tickets: ticket)));
  }

  Future<void> getTicketByNumber(
      TicketGetTicketNumberEvent event, Emitter<TicketSearchState> emit) async {
    emit(TicketLoadingState());

    final result = await _getTicketUseCase(
        GetTicketUseCaseParams(byrNumber: event.number));

    result.fold(
        (failure) => emit(TicketLoadingErrorState(
            title: 'Ошибка!',
            message:
                'Заказ с таким номером брони ${event.number} не найдено"')),
        (ticket) => emit(TicketLoadedState(tickets: ticket)));
  }
}
