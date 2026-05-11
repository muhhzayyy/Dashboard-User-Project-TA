import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final RxBool isOldPasswordObscure = true.obs;
  final RxBool isNewPasswordObscure = true.obs;

  void toggleOldPasswordVisibility() {
    isOldPasswordObscure.value = !isOldPasswordObscure.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordObscure.value = !isNewPasswordObscure.value;
  }

  void changePassword() {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Password lama dan baru tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPassword.length < 6) {
      Get.snackbar(
        'Gagal',
        'Password baru minimal 6 karakter',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // TODO: Tambahkan logic API call di sini
    Get.snackbar(
      'Berhasil',
      'Password berhasil diganti',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}
