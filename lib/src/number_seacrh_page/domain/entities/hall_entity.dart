import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hall_entity.g.dart';

@JsonSerializable()
class HallEntity extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final String? hash;
  const HallEntity({
    this.id,
    this.name,
    this.code,
    this.hash,
  });

  @override
  List<Object?> get props => [id, name, code, hash];

  factory HallEntity.fromJson(Map<String, dynamic> json) =>
      _$HallEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HallEntityToJson(this);
}
