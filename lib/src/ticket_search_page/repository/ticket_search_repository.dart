import 'package:support/core/utils/typedef.dart';

import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';

abstract class TicketSearchRepository {
  ResultFuture<List<TicketModel>> getTicket(String? byNumber, String? byId);
}
