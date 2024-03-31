// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:get_it/get_it.dart';
import 'package:support/injections/dio/booking_dio.dart';
import 'package:support/injections/dio/push_dio.dart';
import 'package:support/main.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
        .putIfAbsent("Platform", () => Platform.isWindows ? "Android" : "iOS");
    handler.next(options);
  }
}

String _apiToken(Environment env, ApiType apiType) {
  if (env == Environment.TEST) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Njg2ODU3OTksImVtcGxveWVlX2lkIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM2IiwibG9naW4iOiJrdWF0LmJvZGlrb3YiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Imt1YXQuYm9kaWtvdiIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.HwfBjJ-gLDCnmzHnIgAfPnMXt328mww1z1nkYtvrx_w";
      case ApiType.BOOKING:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbXBsb3llZV9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMiIsImxvZ2luIjoibW9iaWxlLnRlc3QiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Im1vYmlsZSIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.gZku3KviJgEUE_vdMMCZfdZo5sk7AneIezJ-2y7mCnU";
      case ApiType.PUSH:
        return "AAAAaxe7sHE:APA91bED6RDGoVF9rpPqvrAeqGw7xo4pOnFQddZP2QiAnvKwTl1r17_O-mf3f4ouYUxLl_szALeOLfblerKUHWWJuGVRndZG0-xNi58vrzpWh7DpWAyNg9N4ECqzGq1L38DsMMcKwJHt";
      default:
        throw Exception("WRONG API TYPE");
    }
  } else if (env == Environment.TEST_UA) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Njg2ODU3OTksImVtcGxveWVlX2lkIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM2IiwibG9naW4iOiJrdWF0LmJvZGlrb3YiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Imt1YXQuYm9kaWtvdiIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.HwfBjJ-gLDCnmzHnIgAfPnMXt328mww1z1nkYtvrx_w";
      case ApiType.BOOKING:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbXBsb3llZV9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMiIsImxvZ2luIjoibW9iaWxlLnRlc3QiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Im1vYmlsZSIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.gZku3KviJgEUE_vdMMCZfdZo5sk7AneIezJ-2y7mCnU";
      case ApiType.PUSH:
        return "AAAAaxe7sHE:APA91bED6RDGoVF9rpPqvrAeqGw7xo4pOnFQddZP2QiAnvKwTl1r17_O-mf3f4ouYUxLl_szALeOLfblerKUHWWJuGVRndZG0-xNi58vrzpWh7DpWAyNg9N4ECqzGq1L38DsMMcKwJHt";
      default:
        throw Exception("WRONG API TYPE");
    }
  } else if (env == Environment.PRODUCTION) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Njg2ODU3OTksImVtcGxveWVlX2lkIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM2IiwibG9naW4iOiJrdWF0LmJvZGlrb3YiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Imt1YXQuYm9kaWtvdiIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.HwfBjJ-gLDCnmzHnIgAfPnMXt328mww1z1nkYtvrx_w";
      case ApiType.BOOKING:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbXBsb3llZV9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDIwMyIsImxvZ2luIjoibW9iaWxlLnByb2QiLCJyb2xlIjoibW9iaWxlIiwibmFtZSI6Im1vcGJpbGUucHJvZCIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.oFH0qbTGMHkNYPA9XP2P2J1pCR0lT_nwdeIRrLFlDJY";
      case ApiType.PUSH:
        return "AAAAaxe7sHE:APA91bED6RDGoVF9rpPqvrAeqGw7xo4pOnFQddZP2QiAnvKwTl1r17_O-mf3f4ouYUxLl_szALeOLfblerKUHWWJuGVRndZG0-xNi58vrzpWh7DpWAyNg9N4ECqzGq1L38DsMMcKwJHt";
      default:
        throw Exception("WRONG API TYPE");
    }
  } else if (env == Environment.PRODUCTION_UA) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Njg2ODU3OTksImVtcGxveWVlX2lkIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDM2IiwibG9naW4iOiJrdWF0LmJvZGlrb3YiLCJyb2xlIjoiZGV2ZWxvcGVyIiwibmFtZSI6Imt1YXQuYm9kaWtvdiIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.HwfBjJ-gLDCnmzHnIgAfPnMXt328mww1z1nkYtvrx_w";
      case ApiType.BOOKING:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbXBsb3llZV9pZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDIwMyIsImxvZ2luIjoibW9iaWxlLnByb2QiLCJyb2xlIjoibW9iaWxlIiwibmFtZSI6Im1vcGJpbGUucHJvZCIsImN1c3RvbV9jbGFpbXMiOnsiY29udHJhY3RfaWQiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTAifX0.oFH0qbTGMHkNYPA9XP2P2J1pCR0lT_nwdeIRrLFlDJY";
      case ApiType.PUSH:
        return "AAAAaxe7sHE:APA91bED6RDGoVF9rpPqvrAeqGw7xo4pOnFQddZP2QiAnvKwTl1r17_O-mf3f4ouYUxLl_szALeOLfblerKUHWWJuGVRndZG0-xNi58vrzpWh7DpWAyNg9N4ECqzGq1L38DsMMcKwJHt";
      default:
        throw Exception("WRONG API TYPE");
    }
  }
  throw Exception("WRONG ENV");
}

String _baseUrl(Environment env, ApiType apiType) {
  if (env == Environment.TEST) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "https://test.afisha.api.kinopark.kz";
      case ApiType.BOOKING:
        return "https://test.booking.api.kinopark.kz";
      case ApiType.PUSH:
        return "https://fcm.googleapis.com";
      default:
        throw Exception("WRONG API TYPE");
    }
  } else if (env == Environment.TEST_UA) {
    switch (apiType) {
      case ApiType.AFISHA:
        return "https://test.afisha.api.kinopark.kz";
      case ApiType.BOOKING:
        return "https://test.booking.api.kinopark.kz";
      case ApiType.PUSH:
        return "https://fcm.googleapis.com";
      default:
        throw Exception("WRONG API TYPE");
    }
  } else if (env == Environment.PRODUCTION) {
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
  } else if (env == Environment.PRODUCTION_UA) {
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
  throw Exception("WRONG ENV");
}

void init(Environment env) async {
  // Register Afisha Dio
  getIt.registerLazySingleton<Dio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(env, ApiType.AFISHA),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      headers: {
        "Authorization": "Bearer ${_apiToken(env, ApiType.AFISHA)}",
      },
    );
    final dio = Dio(options);
    dio.interceptors.add(AppVersionInterceptor(version: "*/*"));
    dio.interceptors.add(TalkerDioLogger(
        talker: GetIt.I<Talker>(),
        settings: const TalkerDioLoggerSettings(
            printRequestData: true,
            printResponseData: true,
            printResponseMessage: true,
            printRequestHeaders: true,
            printResponseHeaders: false)));

    return dio;
  });

  // Register Booking Dio
  getIt.registerLazySingleton<BookingDio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(env, ApiType.BOOKING),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      headers: {
        "Authorization": "Bearer ${_apiToken(env, ApiType.BOOKING)}",
      },
    );

    final bookingDio = BookingDio();
    bookingDio.options = options;
    bookingDio.httpClientAdapter = IOHttpClientAdapter();

    // bookingDio.interceptors.add(AppVersionInterceptor(version: "*/*"));

    bookingDio.interceptors.add(TalkerDioLogger(
        talker: GetIt.I<Talker>(),
        settings: const TalkerDioLoggerSettings(
            printRequestData: true,
            printResponseData: false,
            printResponseMessage: true,
            printRequestHeaders: true,
            printResponseHeaders: false)));

    return bookingDio;
  });

  // Register Push Dio
  getIt.registerLazySingleton<PushDio>(() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl(env, ApiType.PUSH),
      connectTimeout: const Duration(milliseconds: TIMEOUT),
      receiveTimeout: const Duration(milliseconds: TIMEOUT),
      // headers: {
      //   "Authorization": "Bearer ${_apiToken(env, ApiType.PUSH)}",
      // },
    );

    final pushDio = PushDio();
    pushDio.options = options;
    pushDio.httpClientAdapter = IOHttpClientAdapter();
    pushDio.interceptors.add(TalkerDioLogger(
        talker: GetIt.I<Talker>(),
        settings: const TalkerDioLoggerSettings(
            printRequestData: true,
            printResponseData: false,
            printResponseMessage: true,
            printRequestHeaders: true,
            printResponseHeaders: false)));

    // pushDio.interceptors
    //     .add(AppVersionInterceptor(version: 'version=1.0.0-mobile'));

    pushDio.interceptors.add(LogInterceptor(responseBody: true));

    return pushDio;
  });
}
