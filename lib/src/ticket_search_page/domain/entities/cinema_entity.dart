import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:support/src/ticket_search_page/domain/entities/distributor_entity.dart';

part 'cinema_entity.g.dart';

@JsonSerializable()
class CinemaEntity extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final String? terminal;
  final DistributorEntity? distributor;
  final String? address;
  final String? hash;

  const CinemaEntity({
    this.id,
    this.name,
    this.code,
    this.terminal,
    this.distributor,
    this.address,
    this.hash,
  });

  @override
  List<Object?> get props =>
      [id, name, code, terminal, distributor, address, hash];

  factory CinemaEntity.fromJson(Map<String, dynamic> json) =>
      _$CinemaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaEntityToJson(this);
}
