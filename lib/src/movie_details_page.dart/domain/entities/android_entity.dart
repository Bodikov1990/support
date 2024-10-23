import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'android_entity.g.dart';

@JsonSerializable()
class AndroidEntity extends Equatable {
  final String? priority;

  const AndroidEntity({this.priority = "high"});

  @override
  List<Object?> get props => [];

  factory AndroidEntity.fromJson(Map<String, dynamic> json) =>
      _$AndroidEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AndroidEntityToJson(this);
}
