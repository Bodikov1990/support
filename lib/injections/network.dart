// ignore_for_file: constant_identifier_names
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

import 'package:get_it/get_it.dart';
import 'package:support/injections/dio/booking_dio.dart';
import 'package:support/injections/dio/push_dio.dart';

enum ApiType {
  AFISHA,
  BOOKING,
  PUSH,
}

const TIMEOUT = 60000;
final getIt = GetIt.instance;

class AppVersionInterceptor extends Interceptor {
  final String version;

  AppVersionInterceptor({required this.version});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.putIfAbsent("Accept", () => "application/json; $version");
    options.headers
        .putIfAbsent("Platform", () => Platform.isAndroid ? "Android" : "iOS");
    handler.next(options);
  }
}

String _apiToken(ApiType apiType) {
  switch (apiType) {
    case ApiType.AFISHA:
      return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Njg2ODU3OTksImVtcGxveWVlX2lkIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM2IiwibG9naW4iOiJrdWF0LmJvZGlrb3YiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Imt1YXQuYm9kaWtvdiIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.HwfBjJ-gLDCnmzHnIgAfPnMXt328mww1z1nkYtvrx_w";
    case ApiType.BOOKING:
      return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbXBsb3llZV9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwNCIsImxvZ2luIjoiYm9va2luZy1tZ3IucHJvZCIsInJvbGUiOiJib29raW5nLW1nciIsIm5hbWUiOiJib29raW5nLW1nci5wcm9kIiwiY3VzdG9tX2NsYWltcyI6eyJjb250cmFjdF9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAxMCJ9fQ.fr9je6fFDDVgVDWvoV0fRsl7Temoa2doCA_gwKZywhU";
    case ApiType.PUSH:
      return "AAAAaxe7sHE:APA91bED6RDGoVF9rpPqvrAeqGw7xo4pOnFQddZP2QiAnvKwTl1r17_O-mf3f4ouYUxLl_szALeOLfblerKUHWWJuGVRndZG0-xNi58vrzpWh7DpWAyNg9N4ECqzGq1L38DsMMcKwJHt";
    default:
      throw Exception("WRONG API TYPE");
  }
}

String _baseUrl(ApiType apiType) {
  switch (apiType) {
    case ApiType.AFISHA:
      return "https://afisha.api.kinopark.kz";
    case ApiType.BOOKING:
      return "https://booking.wci.kinopark.kz";
    case ApiType.PUSH:
      return "https://fcm.googleapis.com";
    default:
      throw Exception("WRONG API TYPE");
  }
}

void init() async {
  // Register Afisha Dio
  getIt.registerLazySingleton<Dio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(ApiType.AFISHA),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      headers: {
        "Authorization": "Bearer ${_apiToken(ApiType.AFISHA)}",
      },
    );
    final dio = Dio(options);
    dio.interceptors.add(AppVersionInterceptor(version: "*/*"));
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  });

  // Register Booking Dio
  getIt.registerLazySingleton<BookingDio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(ApiType.BOOKING),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      headers: {
        "Authorization": "Bearer ${_apiToken(ApiType.BOOKING)}",
      },
    );

    final bookingDio = BookingDio();
    bookingDio.options = options;
    bookingDio.httpClientAdapter = IOHttpClientAdapter();

    bookingDio.interceptors
        .add(AppVersionInterceptor(version: 'version=1.0.0-mobile'));

    bookingDio.interceptors.add(LogInterceptor(responseBody: true));
    bookingDio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    return bookingDio;
  });

  // Register Push Dio
  getIt.registerLazySingleton<PushDio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(ApiType.PUSH),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      headers: {
        "Authorization": "Bearer ${_apiToken(ApiType.PUSH)}",
      },
    );

    final pushDio = PushDio();
    pushDio.options = options;
    pushDio.httpClientAdapter = IOHttpClientAdapter();

    pushDio.interceptors
        .add(AppVersionInterceptor(version: 'version=1.0.0-mobile'));

    pushDio.interceptors.add(LogInterceptor(responseBody: true));

    return pushDio;
  });
}
