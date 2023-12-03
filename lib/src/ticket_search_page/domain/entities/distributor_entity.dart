import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distributor_entity.g.dart';

@JsonSerializable()
class DistributorEntity extends Equatable {
  final String? id;
  final String? url;

  const DistributorEntity({
    this.id,
    this.url,
  });

  @override
  List<Object?> get props => [id, url];

  factory DistributorEntity.fromJson(Map<String, dynamic> json) =>
      _$DistributorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorEntityToJson(this);
}
