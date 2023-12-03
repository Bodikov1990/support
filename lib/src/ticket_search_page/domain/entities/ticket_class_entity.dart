import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/ticket_search_page/domain/entities/detail_entity.dart';

part 'ticket_class_entity.g.dart';

@JsonSerializable()
class TicketClassEntity extends Equatable {
  final String? id;
  final String? number;
  @JsonKey(name: 'qr_code')
  final String? qrCode;
  final int? amount;
  final DetailEntity? detail;
  final int? status;

  const TicketClassEntity({
    this.id,
    this.number,
    this.qrCode,
    this.amount,
    this.detail,
    this.status,
  });

  @override
  List<Object?> get props => [id, number, qrCode, amount, detail, status];

  factory TicketClassEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketClassEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TicketClassEntityToJson(this);
}
