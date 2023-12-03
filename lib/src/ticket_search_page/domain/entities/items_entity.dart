import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:support/src/ticket_search_page/domain/entities/ticket_class_entity.dart';

part 'items_entity.g.dart';

@JsonSerializable()
class ItemsEntity extends Equatable {
  final TicketClassEntity? ticket;

  const ItemsEntity({
    this.ticket,
  });

  @override
  List<Object?> get props => [ticket];

  factory ItemsEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsEntityToJson(this);
}
