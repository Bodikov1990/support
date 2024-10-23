// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_element_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentElementEntity _$PaymentElementEntityFromJson(
        Map<String, dynamic> json) =>
    PaymentElementEntity(
      id: json['id'] as String?,
      type: (json['type'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PaymentElementEntityToJson(
        PaymentElementEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
    };
