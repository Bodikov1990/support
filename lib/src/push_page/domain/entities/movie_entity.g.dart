// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      genres:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      directors: (json['directors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      actors:
          (json['actors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'genre': instance.genres,
      'directors': instance.directors,
      'actors': instance.actors,
    };
