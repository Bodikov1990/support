import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_entity.g.dart';

@JsonSerializable()
class CustomerEntity extends Equatable {
  final String? id;
  final String? phone;
  final String? email;

  const CustomerEntity({
    this.id,
    this.phone,
    this.email,
  });

  @override
  List<Object?> get props => [id, phone, email];

  factory CustomerEntity.fromJson(Map<String, dynamic> json) =>
      _$CustomerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerEntityToJson(this);
}
