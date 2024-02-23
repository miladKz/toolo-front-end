import 'package:flutter/material.dart';
import 'package:get/get.dart';

void progressDialog({required bool isShow}) {
  isShow ? _showProgressDialog() : _dismissProgressDialog();
}

void _showProgressDialog() {
  if (!isDialogOpen) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
      useSafeArea: true,
    );
  }
}

void _dismissProgressDialog() {
  try {
    if (isDialogOpen) {
      Get.back();
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

bool get isDialogOpen {
  bool? isDialogOpen = Get.isDialogOpen;
  if (!isDialogOpen!) {
    return false;
  } else {
    return true;
  }
}
