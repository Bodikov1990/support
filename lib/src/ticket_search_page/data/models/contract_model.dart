import 'package:support/src/ticket_search_page/domain/entities/contract_entity.dart';

class ContractModel extends ContractEntity {
  const ContractModel({
    required super.id,
    required super.name,
    required super.payments,
  });
}
