import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import '../routes/app_routes.dart';

class DetailKerusakanController extends GetxController {
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final isLoading = false.obs;
  final selectedDamageType = 'Pecah'.obs;
  final damageTypes = ['Pecah', 'Baret', 'Hilang', 'Rusak Elektronik'].obs;

  @override
  void onClose() {
    descriptionController.dispose();
    locationController.dispose();
    super.onClose();
  }

  // ✅ UBAH DARI Future<void> MENJADI void
  void submitReport() async {
    if (descriptionController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Deskripsi kerusakan wajib diisi",
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        "Berhasil",
        "Laporan kerusakan telah dikirim",
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRoutes.main);
    } catch (e) {
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
  }
}
