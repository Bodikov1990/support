import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/android_entity.dart';

part 'android_model.g.dart';

@JsonSerializable()
class AndroidModel extends AndroidEntity {
  const AndroidModel();

  factory AndroidModel.fromJson(Map<String, dynamic> json) =>
      _$AndroidModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidModelToJson(this);
}
