import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/components/button/dashboard_button.dart';
import 'package:project_ta3/controlles/dashboard_controllers.dart';
import 'package:project_ta3/routes/app_routes.dart';
import '../components/card/barang_card.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController controller = Get.put(DashboardController());

  final Color primaryMaroon = const Color(0xFF8B1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── HEADER ──
              Row(
                children: [
                  Text(
                    "Hi Jokovic",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryMaroon,
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text("👋", style: TextStyle(fontSize: 26)),

                  const Spacer(),

                  // ── Icon Notifikasi ──
                  IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.notification),
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: primaryMaroon,
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ── BUTTON MENU ──
              Row(
                children: [
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.inventory_2_outlined,
                      label: "Pinjam Barang",
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: DashboardButton(
                      icon: Icons.build_outlined,
                      label: "Lapor Kerusakan",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // ── TITLE ──
              Text(
                "Barang Dipinjam",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryMaroon,
                ),
              ),

              const SizedBox(height: 15),

              // ── LIST BARANG ──
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listBarang.length,
                  itemBuilder: (context, index) {
                    return BarangCard(item: controller.listBarang[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
