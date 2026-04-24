import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/detail_kerusakan_controller.dart';
import '../components/button/default_button.dart';

class DetailKerusakanPage extends StatelessWidget {
  const DetailKerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Ambil controller di awal build
    final controller = Get.find<DetailKerusakanController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Lapor Kerusakan',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deskripsi Kerusakan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Jelaskan detail kerusakannya...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ✅ SOLUSI: Simpan controller di variable luar Obx
            Obx(() {
              return DefaultButton(
                text: controller.isLoading.value
                    ? 'Mengirim...'
                    : 'Kirim Laporan',
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.submitReport(),
                fullWidth: true,
              );
            }),
          ],
        ),
      ),
    );
  }
}
