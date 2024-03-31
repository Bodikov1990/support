import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aps_entity.g.dart';

@JsonSerializable()
class Aps extends Equatable {
  @JsonKey(name: 'mutable-content')
  final int? mutableContent;

  const Aps({this.mutableContent = 1});

  @override
  List<Object?> get props => [];

  factory Aps.fromJson(Map<String, dynamic> json) => _$ApsFromJson(json);

  Map<String, dynamic> toJson() => _$ApsToJson(this);
}
