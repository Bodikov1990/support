// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractEntity _$ContractEntityFromJson(Map<String, dynamic> json) =>
    ContractEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentElementEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContractEntityToJson(ContractEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'payments': instance.payments,
    };
