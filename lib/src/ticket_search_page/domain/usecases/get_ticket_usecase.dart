// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';

import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';
import 'package:support/src/ticket_search_page/domain/entities/ticket_entity.dart';
import 'package:support/src/ticket_search_page/repository/ticket_search_repository.dart';

class GetTicketUseCase
    extends UsecaseWithParams<TicketEntity, GetTicketUseCaseParams> {
  final TicketSearchRepository _repository =
      GetIt.instance<TicketSearchRepository>();

  @override
  ResultFuture<TicketModel> call(params) async =>
      _repository.getTicket(params.byrNumber, params.byId);
}

class GetTicketUseCaseParams {
  final String? byrNumber;
  final String byId;

  GetTicketUseCaseParams({
    this.byrNumber,
    required this.byId,
  });
}
