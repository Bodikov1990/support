import 'package:support/src/number_seacrh_page/domain/entities/ticket_class_entity.dart';

class TicketClassModel extends TicketClassEntity {
  const TicketClassModel({
    required super.id,
    required super.number,
    required super.qrCode,
    required super.amount,
    required super.detail,
    required super.status,
  });
}
