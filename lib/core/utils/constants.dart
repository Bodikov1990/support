// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

enum MovieType {
  TODAY,
  SOON,
  PRE_SALE,
}

extension MovieTypeExtension on MovieType {
  String get apiValue {
    switch (this) {
      case MovieType.TODAY:
        return '';
      case MovieType.SOON:
        return '';
      case MovieType.PRE_SALE:
        return 'PRESALE';
      default:
        return '';
    }
  }
}

enum OrderStatus {
  ORDER_STATUS_UNKNOWN,
  ORDER_CREATED,
  ORDER_PROCESSED,
  ORDER_SUCCESS,
  ORDER_FAILED,
  ORDER_CANCELED,
  ORDER_RETURNED,
}

enum PaymentStatus {
  PAYMENT_STATUS_UNKNOWN,
  PAYMENT_CREATED,
  PAYMENT_PROCESING,
  PAYMENT_BLOCKED,
  PAYMENT_REFUND_PROCESSING,
  PAYMENT_SUCCESS,
  PAYMENT_REFUNDED,
  PAYMENT_CANCELED,
  PAYMENT_FAILED,
  PAYMENT_REJECTED,
}

extension OrderStatusExtension on OrderStatus {
  static OrderStatus fromInt(int value) {
    switch (value) {
      case 0:
        return OrderStatus.ORDER_STATUS_UNKNOWN;
      case 1:
        return OrderStatus.ORDER_CREATED;
      case 2:
        return OrderStatus.ORDER_PROCESSED;
      case 3:
        return OrderStatus.ORDER_SUCCESS;
      case 4:
        return OrderStatus.ORDER_FAILED;
      case 5:
        return OrderStatus.ORDER_CANCELED;
      case 6:
        return OrderStatus.ORDER_RETURNED;
      default:
        return OrderStatus.ORDER_STATUS_UNKNOWN;
    }
  }
}

extension OrderStatusRusExtension on OrderStatus {
  String get inRussian {
    switch (this) {
      case OrderStatus.ORDER_STATUS_UNKNOWN:
        return 'Неизвестный статус';
      case OrderStatus.ORDER_CREATED:
        return 'Заказ создан';
      case OrderStatus.ORDER_PROCESSED:
        return 'Заказ обработан';
      case OrderStatus.ORDER_SUCCESS:
        return 'Заказ выполнен успешно';
      case OrderStatus.ORDER_FAILED:
        return 'Ошибка заказа';
      case OrderStatus.ORDER_CANCELED:
        return 'Заказ отменен';
      case OrderStatus.ORDER_RETURNED:
        return 'Заказ возвращен';
      default:
        return 'Неизвестный статус';
    }
  }
}

extension PaymentStatusRusExtension on PaymentStatus {
  String get inRussian {
    switch (this) {
      case PaymentStatus.PAYMENT_STATUS_UNKNOWN:
        return 'Неизвестный статус платежа';
      case PaymentStatus.PAYMENT_CREATED:
        return 'Платеж создан';
      case PaymentStatus.PAYMENT_PROCESING:
        return 'Платеж обрабатывается';
      case PaymentStatus.PAYMENT_BLOCKED:
        return 'Платеж заблокирован';
      case PaymentStatus.PAYMENT_REFUND_PROCESSING:
        return 'Обработка возврата платежа';
      case PaymentStatus.PAYMENT_SUCCESS:
        return 'Платеж успешен';
      case PaymentStatus.PAYMENT_REFUNDED:
        return 'Платеж возвращен';
      case PaymentStatus.PAYMENT_CANCELED:
        return 'Платеж отменен';
      case PaymentStatus.PAYMENT_FAILED:
        return 'Ошибка платежа';
      case PaymentStatus.PAYMENT_REJECTED:
        return 'Платеж отклонен';
      default:
        return 'Неизвестный статус платежа';
    }
  }
}

extension PaymentStatusExtension on PaymentStatus {
  static PaymentStatus fromInt(int value) {
    switch (value) {
      case 0:
        return PaymentStatus.PAYMENT_STATUS_UNKNOWN;
      case 1:
        return PaymentStatus.PAYMENT_CREATED;
      case 2:
        return PaymentStatus.PAYMENT_PROCESING;
      case 3:
        return PaymentStatus.PAYMENT_BLOCKED;
      case 4:
        return PaymentStatus.PAYMENT_REFUND_PROCESSING;
      case 5:
        return PaymentStatus.PAYMENT_SUCCESS;
      case 7:
        return PaymentStatus.PAYMENT_REFUNDED;
      case 8:
        return PaymentStatus.PAYMENT_CANCELED;
      case 9:
        return PaymentStatus.PAYMENT_FAILED;
      case 10:
        return PaymentStatus.PAYMENT_REJECTED;
      default:
        return PaymentStatus.PAYMENT_STATUS_UNKNOWN;
    }
  }
}

extension OrderStatusColorExtension on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.ORDER_STATUS_UNKNOWN:
        return Colors.grey;
      case OrderStatus.ORDER_CREATED:
        return Colors.blue;
      case OrderStatus.ORDER_PROCESSED:
        return Colors.lightBlue;
      case OrderStatus.ORDER_SUCCESS:
        return Colors.green;
      case OrderStatus.ORDER_FAILED:
        return Colors.red;
      case OrderStatus.ORDER_CANCELED:
        return Colors.orange;
      case OrderStatus.ORDER_RETURNED:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

extension PaymentStatusColorExtension on PaymentStatus {
  Color get color {
    switch (this) {
      case PaymentStatus.PAYMENT_STATUS_UNKNOWN:
        return Colors.grey;
      case PaymentStatus.PAYMENT_CREATED:
        return Colors.blue;
      case PaymentStatus.PAYMENT_PROCESING:
        return Colors.lightBlue;
      case PaymentStatus.PAYMENT_BLOCKED:
        return Colors.black;
      case PaymentStatus.PAYMENT_REFUND_PROCESSING:
        return Colors.orange;
      case PaymentStatus.PAYMENT_SUCCESS:
        return Colors.green;
      case PaymentStatus.PAYMENT_REFUNDED:
        return Colors.purple;
      case PaymentStatus.PAYMENT_CANCELED:
        return Colors.orange;
      case PaymentStatus.PAYMENT_FAILED:
        return Colors.red;
      case PaymentStatus.PAYMENT_REJECTED:
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}

const String PARAM_CITY = "city";
const String PARAM_MOVIE = "movie";
const String PARAM_CINEMA = "object";
const String PARAM_END = "end";
const String PARAM_START = "start";
const String PARAM_RELEASE_DATE = "release_date";
const String PARAM_FORMAT = "format";
const String newMovies = "new_movies";
const String movieChannel = "movies_channel";
const String bigPicture = 'BigPicture';
const String highPriority = 'High';
