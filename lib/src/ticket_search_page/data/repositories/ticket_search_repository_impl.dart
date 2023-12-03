import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/ticket_search_page/data/models/datasource/ticket_search_remote_datasource.dart';
import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';
import 'package:support/src/ticket_search_page/repository/ticket_search_repository.dart';

class TicketSearchRepositoryImpl implements TicketSearchRepository {
  final TicketSearchRemoteDataSource _remoteDataSource =
      GetIt.instance<TicketSearchRemoteDataSource>();

  @override
  ResultFuture<TicketModel> getTicket(String? byNumber, String? byId) async {
    try {
      final result = await _remoteDataSource.getTicket(byNumber, byId);
      final ticketModel = TicketModel(
          id: result.id,
          type: result.type,
          number: result.number,
          contract: result.contract,
          qrcode: result.qrcode,
          customer: result.customer,
          items: result.items,
          payment: result.payment,
          status: result.status,
          total: result.total,
          createdAt: result.createdAt,
          updatedAt: result.updatedAt);
      return Right(ticketModel);
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
