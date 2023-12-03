import 'package:support/src/number_seacrh_page/domain/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  const TicketModel({
    required super.id,
    required super.type,
    required super.number,
    required super.contract,
    required super.qrcode,
    required super.customer,
    required super.items,
    required super.payment,
    required super.status,
    required super.total,
    required super.createdAt,
    required super.updatedAt,
  });
}
