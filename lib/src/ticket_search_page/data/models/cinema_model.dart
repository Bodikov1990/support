import 'package:support/src/ticket_search_page/domain/entities/cinema_entity.dart';

class CinemaModel extends CinemaEntity {
  const CinemaModel({
    required super.id,
    required super.name,
    required super.code,
    required super.terminal,
    required super.distributor,
    required super.address,
    required super.hash,
  });
}
