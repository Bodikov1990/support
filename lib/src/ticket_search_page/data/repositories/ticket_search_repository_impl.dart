import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/ticket_search_page/data/datasource/ticket_search_remote_datasource.dart';
import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';
import 'package:support/src/ticket_search_page/repository/ticket_search_repository.dart';

class TicketSearchRepositoryImpl implements TicketSearchRepository {
  final TicketSearchRemoteDataSource _remoteDataSource =
      GetIt.instance<TicketSearchRemoteDataSource>();

  @override
  ResultFuture<List<TicketModel>> getTicket(
      String? byNumber, String? byId) async {
    try {
      final result = await _remoteDataSource.getTicket(byNumber, byId);

      return Right(result
          .map((ticket) => TicketModel(
              id: ticket.id,
              type: ticket.type,
              number: ticket.number,
              contract: ticket.contract,
              qrcode: ticket.qrcode,
              customer: ticket.customer,
              items: ticket.items,
              payment: ticket.payment,
              status: ticket.status,
              total: ticket.total,
              createdAt: ticket.createdAt,
              updatedAt: ticket.updatedAt))
          .toList());
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
