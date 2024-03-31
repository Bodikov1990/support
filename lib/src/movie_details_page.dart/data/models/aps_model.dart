import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/aps_entity.dart';

part 'aps_model.g.dart';

@JsonSerializable()
class ApsModel extends Aps {
  const ApsModel();

  factory ApsModel.fromJson(Map<String, dynamic> json) =>
      _$ApsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApsModelToJson(this);
}
