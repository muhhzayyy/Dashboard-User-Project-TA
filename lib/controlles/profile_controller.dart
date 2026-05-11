<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class ProfileController extends GetxController {
  // User data (nanti bisa diambil dari API/local storage)
  final userName = 'Surya Setiadi'.obs;
  final userEmail = 'suryasetiadi@gmail.com'.obs;
  final userAvatar = ''.obs;

  void gantiPassword() {
    Get.snackbar(
      'Ganti Password',
      'Fitur ganti password segera hadir',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Clear semua data dan kembali ke login
              Get.offAllNamed(AppRoutes.login);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
=======
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var nama = "Jokovic".obs;
  var email = "jokovic@gmail.com".obs;
  var noHp = "08123456789".obs;
>>>>>>> 4c62efb (membetulkan ui)
}
