import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinLockController extends GetxController {
  final TextEditingController _pinController = TextEditingController();

  // Getter to access the private _pinController
  TextEditingController get pinController => _pinController;

  // Function to check the PIN (this is assumed, as it's not in the original code)
  void checkPin(String enteredPin) {
    // PIN checking logic (this is a placeholder, you should replace it with your actual logic)
    if (enteredPin == '1234') {
      Get.snackbar('Success', 'PIN is correct!');
    } else {
      Get.snackbar('Error', 'Incorrect PIN.');
    }
  }

  @override
  void onClose() {
    _pinController.dispose();
    super.onClose();
  }
}
