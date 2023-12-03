// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaEntity _$CinemaEntityFromJson(Map<String, dynamic> json) => CinemaEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      terminal: json['terminal'] as String?,
      distributor: json['distributor'] == null
          ? null
          : DistributorEntity.fromJson(
              json['distributor'] as Map<String, dynamic>),
      address: json['address'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$CinemaEntityToJson(CinemaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'terminal': instance.terminal,
      'distributor': instance.distributor,
      'address': instance.address,
      'hash': instance.hash,
    };
