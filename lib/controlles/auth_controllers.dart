import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/services/auth_service.dart';
import 'package:project_ta3/routes/app_routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isObscure = true.obs;

  void togglePasswordView() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan Password harus diisi",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      /// 🔥 PAKAI BOOL (DUMMY)
      bool success = await AuthService.login(email, pass);

      if (success) {
        Get.snackbar(
          "Sukses",
          "Login berhasil",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed(AppRoutes.mainNav);
      } else {
        Get.snackbar(
          "Gagal",
          "Username atau password salah",
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      print("ERROR LOGIN: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
