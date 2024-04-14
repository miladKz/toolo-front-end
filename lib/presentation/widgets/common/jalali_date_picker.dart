import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}