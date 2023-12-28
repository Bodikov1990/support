// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:support/core/utils/i18n.dart';

const DATE_FORMAT = "yyyy-MM-ddTHH:mm:ss";

extension DateTimeExtension on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final aDate = DateTime(year, month, day);
    if (aDate == today) {
      return true;
    } else {
      return false;
    }
  }

  bool isTomorrow() {
    final now = DateTime.now().add(const Duration(days: 1));
    final today = DateTime(now.year, now.month, now.day);

    final aDate = DateTime(year, month, day);
    if (aDate == today) {
      return true;
    } else {
      return false;
    }
  }
}

String today() => DateTime.now().format(DATE_FORMAT);
String todayPlus1() =>
    DateTime.now().add(const Duration(days: 1)).format(DATE_FORMAT);
String todayPlus2() =>
    DateTime.now().add(const Duration(days: 2)).format(DATE_FORMAT);
String todayPlus3() =>
    DateTime.now().add(const Duration(days: 3)).format(DATE_FORMAT);
String todayPlus4() =>
    DateTime.now().add(const Duration(days: 4)).format(DATE_FORMAT);
String todayPlus5() =>
    DateTime.now().add(const Duration(days: 5)).format(DATE_FORMAT);

String tomorrow() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  return tomorrow.format(DATE_FORMAT);
}

String seanceFormat(
    {required DateTime startTime, required BuildContext context}) {
  final dateTime = DateFormat(
    'd MMMM, HH:mm',
    Localizations.localeOf(context).languageCode,
  ).format(startTime.toLocal());

  String dayText = "";
  if (startTime.isToday()) {
    dayText = "${AppLocalizations.of(context)?.translate('today')}, ";
  } else if (startTime.isTomorrow()) {
    dayText = "${AppLocalizations.of(context)?.translate('tomorrow')}, ";
  }
  return "$dayText$dateTime";
}

String paymentTimerDuration(int seconds) {
  final duration = Duration(seconds: seconds);
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
