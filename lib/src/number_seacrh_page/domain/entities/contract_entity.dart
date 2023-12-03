import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/number_seacrh_page/domain/entities/payment_element_entity.dart';

part 'contract_entity.g.dart';

@JsonSerializable()
class ContractEntity extends Equatable {
  final String? id;
  final String? name;
  final List<PaymentElementEntity>? payments;

  const ContractEntity({
    this.id,
    this.name,
    this.payments,
  });

  @override
  List<Object?> get props => [id, name, payments];

  factory ContractEntity.fromJson(Map<String, dynamic> json) =>
      _$ContractEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ContractEntityToJson(this);
}
