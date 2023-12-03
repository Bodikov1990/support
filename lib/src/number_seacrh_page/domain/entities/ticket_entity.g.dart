// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketEntity _$TicketEntityFromJson(Map<String, dynamic> json) => TicketEntity(
      id: json['id'] as String?,
      type: json['type'] as int?,
      number: json['number'] as String?,
      contract: json['contract'] == null
          ? null
          : ContractEntity.fromJson(json['contract'] as Map<String, dynamic>),
      qrcode: json['qrcode'] as String?,
      customer: json['customer'] == null
          ? null
          : CustomerEntity.fromJson(json['customer'] as Map<String, dynamic>),
      items: json['items'] == null
          ? null
          : ItemsEntity.fromJson(json['items'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : TicketPaymentEntity.fromJson(
              json['payment'] as Map<String, dynamic>),
      status: json['status'] as int?,
      total: json['total'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TicketEntityToJson(TicketEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'number': instance.number,
      'contract': instance.contract,
      'qrcode': instance.qrcode,
      'customer': instance.customer,
      'items': instance.items,
      'payment': instance.payment,
      'status': instance.status,
      'total': instance.total,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
