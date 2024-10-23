import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/payload_entity.dart';

part 'apns_entity.g.dart';

@JsonSerializable()
class ApnsEntity extends Equatable {
  final Payload? payload;
  final Map<String, String>? headers;

  const ApnsEntity(
      {this.payload = const Payload(),
      this.headers = const {"apns-priority": "10"}});

  @override
  List<Object?> get props => [payload, headers];

  factory ApnsEntity.fromJson(Map<String, dynamic> json) =>
      _$ApnsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ApnsEntityToJson(this);
}
