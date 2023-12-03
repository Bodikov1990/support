import 'package:support/src/number_seacrh_page/domain/entities/seat_entity.dart';

class SeatModel extends SeatEntity {
  const SeatModel({
    required super.id,
    required super.discount,
    required super.zoneId,
    required super.row,
    required super.col,
    required super.price,
    required super.status,
  });
}
