<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import '../services/api_service.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  // Instance Service
  final ApiService _apiService = ApiService();

  @override
  void onClose() {
    // ✅ Dispose controller biar gak memory leak
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validasi input kosong
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan password harus diisi",
        backgroundColor: AppColors.error, // ✅ Pakai AppColors
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validasi format email (opsional tapi recommended)
    if (!email.contains('@')) {
      Get.snackbar(
        "Error",
        "Format email tidak valid",
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Panggil service dummy
      final response = await _apiService.login(email, password);

      if (response['status'] == 'success') {
        Get.snackbar(
          "Sukses",
          "Selamat datang, ${response['data']['name']}",
          backgroundColor: AppColors.success, // ✅ Pakai AppColors
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );

        // ✅ Pindah ke Main Page (Navbar Wrapper)
        Get.offAllNamed(AppRoutes.main);
      }
    } catch (e) {
      // Jika gagal (misal password salah)
      Get.snackbar(
        "Gagal",
        e.toString(),
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
=======
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void login() {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
>>>>>>> 4c62efb (membetulkan ui)
  }
}
