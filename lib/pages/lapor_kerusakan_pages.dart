import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/aduan_damage_controller.dart';
import 'package:project_ta3/components/card/aduan_damage_card.dart';
import 'package:project_ta3/components/card/tab_button_widget.dart';
import 'package:project_ta3/routes/app_routes.dart';

class LaporKerusakanPage extends StatelessWidget {
  const LaporKerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AduanDamageController());

    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColor.primary,
            ),
            onPressed: () => Get.toNamed(AppRoutes.notification),
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
                color: AppColor.primary,
              ),
            ),

            const SizedBox(height: 20),

            // ── TAB BUTTON ──
            Row(
              children: [
                TabButtonWidget(
                  label: "Daftar Pinjaman",
                  index: 0,
                  controller: controller,
                ),
                const SizedBox(width: 10),
                TabButtonWidget(
                  label: "Daftar Laporan",
                  index: 1,
                  controller: controller,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── LIST DATA ──
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
}