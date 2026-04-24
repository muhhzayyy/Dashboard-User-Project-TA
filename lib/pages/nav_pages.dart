import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/nav_controllers.dart';
import 'package:project_ta3/pages/barang_pages.dart';
import 'package:project_ta3/pages/dashboard_pages.dart';
import 'package:project_ta3/pages/lapor_kerusakan_pages.dart';
import 'package:project_ta3/pages/profile_page.dart';
import 'package:project_ta3/pages/profile_pages.dart'; // ✅ 1. Pastikan import file profile-nya

class MainNavPage extends StatelessWidget {
  MainNavPage({super.key});

  final controller = Get.put(MainNavController());
  final List<Widget> pages = [
    DashboardPage(),
    BarangPage(),
    const LaporKerusakanPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.greyText,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 28),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined, size: 28),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build_outlined, size: 28),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
