import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/components/item_card.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/home_controller.dart';
import '../components/button/default_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ✅ APP BAR (Tetap di HomePage)
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Hi Jokovic',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Text('👋', style: TextStyle(fontSize: 24)),
          ],
        ),
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

      // ✅ BODY CONTENT
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Buttons
            Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    text: 'Pinjam Barang',
                    onPressed: () {},
                    fullWidth: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DefaultButton(
                    text: 'Lapor Kerusakan',
                    onPressed: () {},
                    fullWidth: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Borrowed Items Section
            const Text(
              'Barang Dipinjam',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // List Items
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];

                  return ItemCard(
                    code: item['code'],
                    name: item['name'],
                    date: item['date'],
                    status: item['status'],
                    onTap: () => controller.navigateToDetail(item),
                  );
                },
              );
            }),
          ],
        ),
      ),

      // ❌ BOTTOM NAVBAR DIHAPUS DARI SINI
      // Navbar sekarang dikelola oleh MainPage
    );
  }
}
