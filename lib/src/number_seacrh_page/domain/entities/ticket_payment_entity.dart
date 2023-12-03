import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_payment_entity.g.dart';

@JsonSerializable()
class TicketPaymentEntity extends Equatable {
  final String? id;
  @JsonKey(name: 'date_time')
  final String? dateTime;
  @JsonKey(name: 'invoice_id')
  final String? invoiceId;
  final int? amount;
  final String? currency;
  final String? terminal;
  @JsonKey(name: 'account_id')
  final String? accountId;
  final String? description;
  final String? language;
  final String? reference;
  final String? code;
  final String? reason;
  final String? email;
  final String? phone;
  @JsonKey(name: 'card_id')
  final String? cardId;
  final int? status;

  const TicketPaymentEntity({
    this.id,
    this.dateTime,
    this.invoiceId,
    this.amount,
    this.currency,
    this.terminal,
    this.accountId,
    this.description,
    this.language,
    this.reference,
    this.code,
    this.reason,
    this.email,
    this.phone,
    this.cardId,
    this.status,
  });

  @override
  List<Object?> get props => [
        id,
        dateTime,
        invoiceId,
        amount,
        currency,
        terminal,
        accountId,
        description,
        reference,
        code,
        reason,
        email,
        phone,
        cardId,
        status
      ];

  factory TicketPaymentEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketPaymentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPaymentEntityToJson(this);
}
