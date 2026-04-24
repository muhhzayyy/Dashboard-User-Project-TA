import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/aduan_damage_controller.dart';
import 'package:project_ta3/widgets/aduan_damage_card.dart';

class LaporKerusakanPage extends StatelessWidget {
  const LaporKerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AduanDamageController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lapor kerusakan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),

            // Tab Buttons
            Obx(
              () => Row(
                children: [
                  _buildTab(controller, label: "Daftar Pinjaman", index: 0),
                  const SizedBox(width: 10),
                  _buildTab(controller, label: "Daftar Laporan", index: 1),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Daftar List
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 0) {
                  return ListView.builder(
                    itemCount: controller.listPinjaman.length,
                    itemBuilder: (context, index) {
                      final item = controller.listPinjaman[index];
                      return AduanDamageCard(
                        status: item.status,
                        namaBarang: item.namaBarang,
                        kode: item.kodePinjam,
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.listAduan.length,
                    itemBuilder: (context, index) {
                      final item = controller.listAduan[index];
                      return AduanDamageCard(
                        status: item.status,
                        namaBarang: item.namaBarang,
                        kode: item.kodeInventaris,
                        deskripsi: item.deskripsiAduan,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    AduanDamageController controller, {
    required String label,
    required int index,
  }) {
    bool isActive = controller.selectedTab.value == index;
    return InkWell(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
