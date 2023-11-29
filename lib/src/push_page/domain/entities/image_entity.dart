import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_entity.g.dart';

@JsonSerializable()
class ImageEntity extends Equatable {
  final String? vertical;
  final String? horizontal;

  const ImageEntity({required this.vertical, required this.horizontal});

  @override
  List<Object?> get props => [vertical, horizontal];

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}
