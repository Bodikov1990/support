import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/ticket_search_page/domain/entities/discount_entity.dart';

part 'seat_entity.g.dart';

@JsonSerializable()
class SeatEntity extends Equatable {
  final String? id;
  final DiscountEntity? discount;
  @JsonKey(name: 'zone_id')
  final String? zoneId;
  final String? row;
  final String? col;
  final int? price;
  final int? status;

  const SeatEntity({
    this.id,
    this.discount,
    this.zoneId,
    this.row,
    this.col,
    this.price,
    this.status,
  });

  @override
  List<Object?> get props => [id, discount, zoneId, row, col, price, status];

  factory SeatEntity.fromJson(Map<String, dynamic> json) =>
      _$SeatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SeatEntityToJson(this);
}
