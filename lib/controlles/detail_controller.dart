import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';

class DetailController extends GetxController {
  void reportDamage() {
    Get.dialog(
      AlertDialog(
        title: const Text('Lapor Kerusakan'),
        content: const Text('Apakah ada kerusakan pada barang ini?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Berhasil',
                'Laporan kerusakan telah dikirim',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.success,
                colorText: Colors.white,
              );
            },
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }
}
