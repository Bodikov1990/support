import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/aps_entity.dart';

part 'payload_entity.g.dart';

@JsonSerializable()
class Payload extends Equatable {
  final Aps? aps;

  const Payload({this.aps = const Aps()});

  @override
  List<Object?> get props => [];

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
