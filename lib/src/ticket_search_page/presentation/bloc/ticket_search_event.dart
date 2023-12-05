part of 'ticket_search_bloc.dart';

abstract class TicketSearchEvent {
  const TicketSearchEvent();
}

final class TicketGetTicketIdEvent extends TicketSearchEvent {
  final String id;

  const TicketGetTicketIdEvent({required this.id});
}

final class TicketGetTicketNumberEvent extends TicketSearchEvent {
  final String number;

  const TicketGetTicketNumberEvent({required this.number});
}
