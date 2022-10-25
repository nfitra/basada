import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnackBar(String error, {String title = 'Error'}) {
  Get.snackbar(
    title,
    error,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    margin: const EdgeInsets.all(16),
    borderRadius: 8,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 2),
  );
}

successSnackBar(String message, {String title = 'Success'}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    margin: const EdgeInsets.all(16),
    borderRadius: 8,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 2),
  );
}
