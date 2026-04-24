import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/controlles/barang_controller.dart';
import 'package:project_ta3/widgets/barang_card.dart';

class BarangPage extends StatelessWidget {
  final controller = Get.put(BarangController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // 🎨 Definisi palet warna berdasarkan foto
    const Color primaryRed = Color(0xFF91282D); // Merah Marun
    const Color backgroundColor = Color(0xFFF5F5F5); // Abu-abu sangat muda

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔔 HEADER (Hanya Icon Notifikasi di Pojok Kanan)
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.notifications_none,
                  color: primaryRed,
                  size: 28,
                ),
              ),

              SizedBox(height: 16),

              // 🔍 SEARCH BAR
              TextField(
                onChanged: controller.setSearchQuery,
                cursorColor: primaryRed,
                decoration: InputDecoration(
                  hintText: "Cari barang...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: Icon(Icons.search, color: primaryRed),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryRed, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryRed, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // 📂 CATEGORY TABS
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.categories.map((cat) {
                      final isActive = controller.selectedCategory.value == cat;

                      return GestureDetector(
                        onTap: () => controller.selectCategory(cat),
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isActive ? primaryRed : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryRed, width: 1.2),
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: isActive ? Colors.white : primaryRed,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // 📦 LIST BARANG
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.filteredBarang.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final barang = controller.filteredBarang[index];

                      // Note: Pastikan BarangCard di file internal Anda juga
                      // menggunakan primaryRed untuk teks dan bordernya.
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: BarangCard(barang: barang),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
