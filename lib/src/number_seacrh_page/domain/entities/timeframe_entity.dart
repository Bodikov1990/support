import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeframe_entity.g.dart';

@JsonSerializable()
class TimeframeEntity extends Equatable {
  final DateTime? start;
  final DateTime? end;

  const TimeframeEntity({
    this.start,
    this.end,
  });

  @override
  List<Object?> get props => [start, end];

  factory TimeframeEntity.fromJson(Map<String, dynamic> json) =>
      _$TimeframeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeframeEntityToJson(this);
}
