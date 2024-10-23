// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_class_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketClassEntity _$TicketClassEntityFromJson(Map<String, dynamic> json) =>
    TicketClassEntity(
      id: json['id'] as String?,
      number: json['number'] as String?,
      qrCode: json['qr_code'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      detail: json['detail'] == null
          ? null
          : DetailEntity.fromJson(json['detail'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TicketClassEntityToJson(TicketClassEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'qr_code': instance.qrCode,
      'amount': instance.amount,
      'detail': instance.detail,
      'status': instance.status,
    };
