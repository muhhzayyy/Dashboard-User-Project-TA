import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/main_controller.dart';
import 'home_page.dart';
import 'inventory_page.dart';
import 'report_page.dart';
import 'profile_page.dart'; // ✅ Import profile page

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(), // Tab 0: Home
      const InventoryPage(), // Tab 1: Inventory
      const ReportPage(), // Tab 2: Report
      const ProfilePage(), // ✅ Tab 3: Profile
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 8,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2),
              label: 'Inventory',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Laporan'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // ✅ Icon solid untuk profile
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
