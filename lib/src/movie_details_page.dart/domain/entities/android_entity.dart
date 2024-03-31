import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'android_entity.g.dart';

@JsonSerializable()
class Android extends Equatable {
  final String? priority;

  const Android({this.priority = "high"});

  @override
  List<Object?> get props => [];

  factory Android.fromJson(Map<String, dynamic> json) =>
      _$AndroidFromJson(json);

  Map<String, dynamic> toJson() => _$AndroidToJson(this);
}
