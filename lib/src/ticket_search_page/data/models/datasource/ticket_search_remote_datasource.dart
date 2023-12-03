import 'package:support/src/ticket_search_page/domain/entities/ticket_entity.dart';

abstract class TicketSearchRemoteDataSource {
  Future<TicketEntity> getTicket(String? byNumber, String? byId);
}

class TicketSearchRemoteDataSourceImpl implements TicketSearchRemoteDataSource {
  @override
  Future<TicketEntity> getTicket(String? byNumber, String? byId) async {
    // TODO: implement getTicket
    throw UnimplementedError();
  }
}
