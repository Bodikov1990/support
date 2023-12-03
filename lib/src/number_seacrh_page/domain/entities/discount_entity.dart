import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_entity.g.dart';

@JsonSerializable()
class DiscountEntity extends Equatable {
  final String? id;
  final String? name;

  const DiscountEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory DiscountEntity.fromJson(Map<String, dynamic> json) =>
      _$DiscountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountEntityToJson(this);
}
