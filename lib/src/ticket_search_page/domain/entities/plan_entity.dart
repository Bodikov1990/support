import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_entity.g.dart';

@JsonSerializable()
class PlanEntity extends Equatable {
  final String? id;

  const PlanEntity({
    this.id,
  });

  @override
  List<Object?> get props => [id];

  factory PlanEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlanEntityToJson(this);
}
