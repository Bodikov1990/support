// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsEntity _$ItemsEntityFromJson(Map<String, dynamic> json) => ItemsEntity(
      ticket: json['ticket'] == null
          ? null
          : TicketClassEntity.fromJson(json['ticket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsEntityToJson(ItemsEntity instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
    };
