import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolo_gostar/di/di.dart';

void showSnack(
    {required String title,
    required String message,
    Duration duration = const Duration(seconds: 3)}) {
  final ThemeData themeData = locator.get<ThemeData>();
  Get.snackbar(title, message,
      titleText: Text(
        title,
        style: themeData.textTheme.titleMedium,
      ),
      messageText: Text(
        message,
        style: themeData.textTheme.bodyMedium,
      ),
      duration: duration,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED);
}
