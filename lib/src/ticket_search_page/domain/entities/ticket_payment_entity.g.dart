// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_payment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPaymentEntity _$TicketPaymentEntityFromJson(Map<String, dynamic> json) =>
    TicketPaymentEntity(
      id: json['id'] as String?,
      dateTime: json['date_time'] as String?,
      invoiceId: json['invoice_id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      terminal: json['terminal'] as String?,
      accountId: json['account_id'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      reference: json['reference'] as String?,
      code: json['code'] as String?,
      reason: json['reason'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cardId: json['card_id'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TicketPaymentEntityToJson(
        TicketPaymentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_time': instance.dateTime,
      'invoice_id': instance.invoiceId,
      'amount': instance.amount,
      'currency': instance.currency,
      'terminal': instance.terminal,
      'account_id': instance.accountId,
      'description': instance.description,
      'language': instance.language,
      'reference': instance.reference,
      'code': instance.code,
      'reason': instance.reason,
      'email': instance.email,
      'phone': instance.phone,
      'card_id': instance.cardId,
      'status': instance.status,
    };
