import 'package:support/src/ticket_search_page/domain/entities/seance_entity.dart';

class SeanceModel extends SeanceEntity {
  const SeanceModel({
    required super.id,
    required super.name,
    required super.code,
    required super.timeframe,
    required super.language,
    required super.hash,
  });
}
