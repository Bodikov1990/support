// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_entity.g.dart';

@JsonSerializable()
class CityEntity extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  @JsonKey(name: 'sort_order')
  final int? sortOrder;

  const CityEntity({
    this.id,
    this.name,
    this.code,
    this.sortOrder,
  });
  @override
  List<Object?> get props => [id, name, code, sortOrder];

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CityEntityToJson(this);
}
