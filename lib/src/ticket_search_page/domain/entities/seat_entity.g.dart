// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatEntity _$SeatEntityFromJson(Map<String, dynamic> json) => SeatEntity(
      id: json['id'] as String?,
      discount: json['discount'] == null
          ? null
          : DiscountEntity.fromJson(json['discount'] as Map<String, dynamic>),
      zoneId: json['zone_id'] as String?,
      row: json['row'] as String?,
      col: json['col'] as String?,
      price: (json['price'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeatEntityToJson(SeatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discount': instance.discount,
      'zone_id': instance.zoneId,
      'row': instance.row,
      'col': instance.col,
      'price': instance.price,
      'status': instance.status,
    };
