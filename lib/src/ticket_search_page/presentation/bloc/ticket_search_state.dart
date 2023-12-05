// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ticket_search_bloc.dart';

abstract class TicketSearchState {
  const TicketSearchState();
}

final class TicketSearchInitial extends TicketSearchState {}

final class TicketLoadingState extends TicketSearchState {}

class TicketLoadedState extends TicketSearchState {
  final List<TicketModel> tickets;
  TicketLoadedState({
    required this.tickets,
  });
}

class TicketLoadingErrorState extends TicketSearchState {
  final String title;
  final String message;
  TicketLoadingErrorState({
    required this.title,
    required this.message,
  });
}
