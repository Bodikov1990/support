import 'package:support/src/ticket_search_page/domain/entities/ticket_payment_entity.dart';

class TicketPaymentModel extends TicketPaymentEntity {
  const TicketPaymentModel({
    required super.id,
    required super.dateTime,
    required super.invoiceId,
    required super.amount,
    required super.currency,
    required super.terminal,
    required super.accountId,
    required super.description,
    required super.language,
    required super.reference,
    required super.code,
    required super.reason,
    required super.email,
    required super.phone,
    required super.cardId,
    required super.status,
  });
}
