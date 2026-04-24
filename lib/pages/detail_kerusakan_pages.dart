import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart'; // ✅ Pastikan path import benar

class DetailKerusakanPage extends StatelessWidget {
  // Jika kamu masih menggunakan model BarangModel untuk kirim data, biarkan ini
  // final BarangModel item;
  // const DetailKerusakanPage({super.key, required this.item});

  const DetailKerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // --- HEADER: STATUS & NO PINJAM ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusTag("Dipinjam"),
                const Text(
                  "#PJ-5001",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // --- TANGGAL PINJAM & KEMBALI ---
            Row(
              children: [
                Expanded(
                  child: _buildInfoSection(
                    "Tgl Peminjaman",
                    "1 Mar 2025",
                    Icons.calendar_today_outlined,
                  ),
                ),
                Expanded(
                  child: _buildInfoSection(
                    "Tgl Pengembalian",
                    "5 Mar 2025",
                    Icons.calendar_today_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // --- LOKASI KEMBALI ---
            _buildInfoSection(
              "Lokasi Kembali",
              "Gedung A",
              Icons.location_on_outlined,
            ),
            const SizedBox(height: 30),

            // --- KARTU BARANG ---
            _buildProductCard(),

            const SizedBox(height: 30),

            // --- TOMBOL ADUKAN KERUSAKAN ---
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Arahkan ke form laporan kerusakan di sini
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Adukan Kerusakan",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER 1: STATUS TAG ---
  Widget _buildStatusTag(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.success,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- HELPER 2: INFO SECTION (Reusable) ---
  Widget _buildInfoSection(String label, String content, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 26),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: AppColors.greyText, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(
                color: AppColors.blackText,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- HELPER 3: PRODUCT CARD ---
  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.image_outlined,
              color: AppColors.greyText,
              size: 35,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Camera canon g7x m3",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "INV-ELK-001",
                  style: TextStyle(color: AppColors.greyText, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
