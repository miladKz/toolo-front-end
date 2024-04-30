import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class JalaliDatePicker {
  static Future<String?> getDate() async {
    Jalali? picked = await showPersianDatePicker(
      context: Get.context!,
      initialDate: Jalali.now(),
      firstDate: Jalali(1360, 1, 1),
      lastDate: Jalali(1410, 1, 1),
    );
    return picked?.formatCompactDate();
  }

  static DateTime toGregorian(String jalaliDate) {
    Jalali jalaliDateTime = parseCompactDate(jalaliDate);
    return jalaliDateTime.toGregorian().toDateTime();
  }

  static String toGregorianAsString(
      {required String jalaliDate,
      String convertFormat = "yyyy-MM-ddTHH:mm:ss"}) {
    Jalali jalaliDateTime = parseCompactDate(jalaliDate);
    String formattedDate =
    DateFormat(convertFormat)
        .format(jalaliDateTime.toGregorian().toDateTime());

    print('Converted Gregorian Date: $formattedDate');
    return formattedDate;
  }

  static String convertJalaliToGregorian(
      {required String dateAsStr,
      Pattern pattern = '/',
      String convertFormat = "yyyy-MM-ddTHH:mm:ss"}) {
    String jalaliDateStr = dateAsStr; // Example Jalali date string
    List<int> splits =    jalaliDateStr.split(pattern).map((e) => int.parse(e)).toList();
    int year = 1377;
    int month = 1;
    int day = 1;
    if (splits.length > 2) {
      day = splits[2];
    }
    if (splits.length > 1) {
      month = splits[1];
    }
    if (splits.isNotEmpty) {
      year = splits[0];
    }

    Jalali parsedDate = Jalali(year, month, day);

    String formattedDate =
        DateFormat(convertFormat).format(parsedDate.toGregorian().toDateTime());

    print('Converted Gregorian Date: $formattedDate');
    return formattedDate;
  }
}