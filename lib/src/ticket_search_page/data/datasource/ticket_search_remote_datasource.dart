import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/injections/dio/booking_dio.dart';
import 'package:support/src/ticket_search_page/domain/entities/ticket_entity.dart';

abstract class TicketSearchRemoteDataSource {
  Future<List<TicketEntity>> getTicket(String? byNumber, String? byId);
}

class TicketSearchRemoteDataSourceImpl implements TicketSearchRemoteDataSource {
  final _bookingDio = GetIt.instance<BookingDio>();

  @override
  Future<List<TicketEntity>> getTicket(String? byNumber, String? byId) async {
    String url = '';

    if (byNumber != null) {
      url = "number=$byNumber";
    } else if (byId != null) {
      url = 'id=$byId';
    }

    try {
      Response response = await _bookingDio.get(
        '/api/order/search?skip=0&limit=15&sort=created_at:desc&$url',
      );

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from TicketSearchRemoteDataSourceImpl",
            statusCode: response.statusCode ?? 0);
      }
      return (response.data as List<dynamic>)
          .map((raw) => TicketEntity.fromJson(raw))
          .toList();
    } on APIExeption {
      rethrow;
    } catch (e) {
      debugPrint("getTicket ${e.toString()} ");
      if (e is DioException) {
        debugPrint("${e.message} ${e.response?.statusMessage ?? ""}");

        throw APIExeption(
            message: e.message ?? "Opps",
            statusCode: e.response?.statusCode ?? 506);
      }
      throw APIExeption(message: e.toString(), statusCode: 507);
    }
  }
}
