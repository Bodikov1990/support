import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_element_entity.g.dart';

@JsonSerializable()
class PaymentElementEntity extends Equatable {
  final String? id;
  final int? type;
  final String? name;

  const PaymentElementEntity({
    this.id,
    this.type,
    this.name,
  });

  @override
  List<Object?> get props => [id, type, name];

  factory PaymentElementEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentElementEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentElementEntityToJson(this);
}
