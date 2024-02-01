import 'package:get/get.dart';

void showSnack({required String title, required String message}) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM);
}
