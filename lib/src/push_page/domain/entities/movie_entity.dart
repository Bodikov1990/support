// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:support/src/push_page/domain/entities/image_entity.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final String? description;

  @JsonKey(name: "genre")
  final List<String>? genres;

  final List<String>? directors;
  final List<String>? actors;
  final String? certification;
  final ImageEntity? image;
  const MovieEntity({
    this.id,
    this.name,
    this.code,
    this.description,
    this.genres,
    this.directors,
    this.actors,
    this.certification,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        description,
        genres,
        directors,
        actors,
        certification,
        image
      ];

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
