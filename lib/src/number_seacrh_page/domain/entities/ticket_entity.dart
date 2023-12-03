import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/number_seacrh_page/domain/entities/contract_entity.dart';
import 'package:support/src/number_seacrh_page/domain/entities/customer_entity.dart';
import 'package:support/src/number_seacrh_page/domain/entities/items_entity.dart';
import 'package:support/src/number_seacrh_page/domain/entities/ticket_payment_entity.dart';

part 'ticket_entity.g.dart';

@JsonSerializable()
class TicketEntity extends Equatable {
  final String? id;
  final int? type;
  final String? number;
  final ContractEntity? contract;
  final String? qrcode;
  final CustomerEntity? customer;
  final ItemsEntity? items;
  final TicketPaymentEntity? payment;
  final int? status;
  final int? total;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const TicketEntity({
    this.id,
    this.type,
    this.number,
    this.contract,
    this.qrcode,
    this.customer,
    this.items,
    this.payment,
    this.status,
    this.total,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        number,
        contract,
        qrcode,
        customer,
        items,
        payment,
        status,
        total,
        createdAt,
        updatedAt
      ];

  factory TicketEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TicketEntityToJson(this);
}
