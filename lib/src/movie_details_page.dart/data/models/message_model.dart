import 'package:json_annotation/json_annotation.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/android_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/apns_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/message_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel extends Message {
  const MessageModel(
      {required super.topic,
      required super.android,
      required super.apns,
      required super.notification,
      required super.data});

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
