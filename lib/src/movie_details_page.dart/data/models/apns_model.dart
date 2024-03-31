import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/apns_entity.dart';

part 'apns_model.g.dart';

@JsonSerializable()
class ApnsModel extends Apns {
  const ApnsModel();

  factory ApnsModel.fromJson(Map<String, dynamic> json) =>
      _$ApnsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApnsModelToJson(this);
}
