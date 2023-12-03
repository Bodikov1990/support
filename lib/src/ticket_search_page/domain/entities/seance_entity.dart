import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/ticket_search_page/domain/entities/timeframe_entity.dart';

part 'seance_entity.g.dart';

@JsonSerializable()
class SeanceEntity extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final TimeframeEntity? timeframe;
  final String? language;
  final String? hash;

  const SeanceEntity({
    this.id,
    this.name,
    this.code,
    this.timeframe,
    this.language,
    this.hash,
  });

  @override
  List<Object?> get props => [id, name, code, timeframe, language, hash];

  factory SeanceEntity.fromJson(Map<String, dynamic> json) =>
      _$SeanceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SeanceEntityToJson(this);
}
