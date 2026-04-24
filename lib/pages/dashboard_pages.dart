import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/pages/detail_peminjaman.dart';

// --- CONTROLLER ---
class DashboardController extends GetxController {
  var listBarang = <BarangModel>[
    BarangModel(
      status: "Dikembalikan",
      kode: "#PJ-5001",
      nama: "Proyektor Epson EB-X400",
      tanggal: "25 Feb 2025",
    ),
    BarangModel(
      status: "Dipinjam",
      kode: "#PJ-5002",
      nama: "Karpet musholla",
      tanggal: "5 Mar 2025",
    ),
    BarangModel(
      status: "Terlambat",
      kode: "#PJ-5002",
      nama: "AC Portable 2 PK",
      tanggal: "1 Mar 2025",
    ),
  ].obs;
}

// --- MODEL ---
class BarangModel {
  final String status;
  final String kode;
  final String nama;
  final String tanggal;
  BarangModel({
    required this.status,
    required this.kode,
    required this.nama,
    required this.tanggal,
  });
}

// --- PAGE ---
class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(DashboardController());
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
              // Header
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
                ],
              ),
              const SizedBox(height: 25),

              // Tombol Utama (Pinjam & Lapor)
              Row(
                children: [
                  Expanded(
                    child: _buildMainButton(
                      Icons.inventory_2_outlined,
                      "Pinjam Barang",
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildMainButton(
                      Icons.build_outlined,
                      "Lapor Kerusakan",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),

              Text(
                "Barang Dipinjam",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryMaroon,
                ),
              ),
              const SizedBox(height: 15),

              // Reaktif List
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listBarang.length,
                  itemBuilder: (context, index) {
                    return _buildBarangCard(controller.listBarang[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper Tombol Utama
  Widget _buildMainButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: primaryMaroon,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper Kartu Barang
  Widget _buildBarangCard(BarangModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          // Garis Merah Samping
          Positioned(
            left: 0,
            top: 15,
            bottom: 15,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: primaryMaroon,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusTag(item.status),
                    Text(
                      item.kode,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.nama,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryMaroon,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16,
                      color: item.status == "Terlambat"
                          ? Colors.red
                          : primaryMaroon,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.tanggal,
                      style: TextStyle(
                        color: item.status == "Terlambat"
                            ? Colors.red
                            : primaryMaroon,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Tombol Lihat Detail dengan Navigasi Dinamis
                GestureDetector(
                  onTap: () => Get.to(() => DetailPeminjamanPage(item: item)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Lihat Detail",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryMaroon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper Tag Status
  Widget _buildStatusTag(String status) {
    Color bgColor = status == "Dikembalikan"
        ? Colors.grey.shade600
        : (status == "Dipinjam"
              ? const Color(0xFF4CAF50)
              : const Color(0xFFE53935));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
