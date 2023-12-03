import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/general_page/domain/entities/city_entity.dart';

import 'package:support/src/push_page/domain/entities/movie_entity.dart';
import 'package:support/src/ticket_search_page/domain/entities/cinema_entity.dart';
import 'package:support/src/ticket_search_page/domain/entities/hall_entity.dart';
import 'package:support/src/ticket_search_page/domain/entities/plan_entity.dart';
import 'package:support/src/ticket_search_page/domain/entities/seance_entity.dart';
import 'package:support/src/ticket_search_page/domain/entities/seat_entity.dart';

part 'detail_entity.g.dart';

@JsonSerializable()
class DetailEntity extends Equatable {
  final CityEntity? city;
  final CinemaEntity? object;
  final HallEntity? hall;
  final PlanEntity? plan;
  final MovieEntity? movie;
  final SeanceEntity? seance;
  final List<SeatEntity>? seats;

  const DetailEntity({
    this.city,
    this.object,
    this.hall,
    this.plan,
    this.movie,
    this.seance,
    this.seats,
  });

  @override
  List<Object?> get props => [city, object, hall, plan, movie, seance, seats];

  factory DetailEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DetailEntityToJson(this);
}
