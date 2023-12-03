// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailEntity _$DetailEntityFromJson(Map<String, dynamic> json) => DetailEntity(
      city: json['city'] == null
          ? null
          : CityEntity.fromJson(json['city'] as Map<String, dynamic>),
      object: json['object'] == null
          ? null
          : CinemaEntity.fromJson(json['object'] as Map<String, dynamic>),
      hall: json['hall'] == null
          ? null
          : HallEntity.fromJson(json['hall'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : PlanEntity.fromJson(json['plan'] as Map<String, dynamic>),
      movie: json['movie'] == null
          ? null
          : MovieEntity.fromJson(json['movie'] as Map<String, dynamic>),
      seance: json['seance'] == null
          ? null
          : SeanceEntity.fromJson(json['seance'] as Map<String, dynamic>),
      seats: (json['seats'] as List<dynamic>?)
          ?.map((e) => SeatEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailEntityToJson(DetailEntity instance) =>
    <String, dynamic>{
      'city': instance.city,
      'object': instance.object,
      'hall': instance.hall,
      'plan': instance.plan,
      'movie': instance.movie,
      'seance': instance.seance,
      'seats': instance.seats,
    };
