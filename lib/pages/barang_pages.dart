import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Pastikan nama folder 'controllers' sudah benar (pakai 'r')

import 'package:project_ta3/controlles/barang_controller.dart'; 
import '../models/barang_models.dart';
import 'detail_peminjaman.dart'; 

class BarangPage extends StatelessWidget {
  const BarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    final controller = Get.put(BarangController());
    const Color primaryMaroon = Color(0xFF8B1A1A);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: primaryMaroon),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari barang...",
                suffixIcon: const Icon(Icons.search, color: primaryMaroon),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primaryMaroon, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // 2. Filter Kategori
          SizedBox(
            height: 40,
            child: Obx(() => ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final cat = controller.categories[index];
                    final isSelected = controller.selectedCategory.value == cat;
                    return GestureDetector(
                      onTap: () => controller.changeCategory(cat),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: isSelected ? primaryMaroon : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryMaroon),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          cat,
                          style: TextStyle(
                            color: isSelected ? Colors.white : primaryMaroon,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
          const SizedBox(height: 15),

          // 3. List Barang
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.listBarang.length,
                  itemBuilder: (context, index) {
                    return _itemCard(context, controller.listBarang[index], primaryMaroon);
                  },
                )),
          ),
        ],
      ),
    );
  }

  // --- UI HELPER: CARD BARANG ---
  Widget _itemCard(BuildContext context, BarangModel item, Color maroon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: item.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(item.imageUrl!, fit: BoxFit.cover),
                      )
                    : const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: maroon),
                    ),
                    const SizedBox(height: 4),
                    Text("Stock Tersedia: ${item.stock ?? 0}", style: TextStyle(color: maroon, fontSize: 13)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _tagBadge(maroon, Icons.location_on, item.lokasi ?? "-"),
                        const SizedBox(width: 6),
                        _tagBadge(maroon, null, item.kategori ?? "-"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              onPressed: () => Get.to(() => DetailPeminjamanPage(item: item)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: maroon, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Pilih Unit", style: TextStyle(color: maroon, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  // --- UI HELPER: BADGE ---
  Widget _tagBadge(Color maroon, IconData? icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: maroon, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 12, color: Colors.white), const SizedBox(width: 4)],
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}