import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_pages.dart'; // Pastikan import ke model BarangModel benar

class DetailPeminjamanPage extends StatelessWidget {
  final BarangModel item;
  const DetailPeminjamanPage({super.key, required this.item});

  final Color primaryMaroon = const Color(0xFF8B1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryMaroon),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryMaroon),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status & Nomor Pinjam
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusTag(item.status),
                Text(
                  item.kode,
                  style: TextStyle(
                    color: primaryMaroon,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Tanggal Pinjam & Kembali (Menggunakan _buildDateInfo)
            Row(
              children: [
                Expanded(
                  child: _buildDateInfo(
                    "Tgl Pinjam",
                    item.tanggal,
                    Icons.calendar_today,
                    true,
                  ),
                ),
                Expanded(
                  child: _buildDateInfo(
                    "Tgl Kembali",
                    "-", // Bisa kamu sesuaikan datanya nanti
                    Icons.calendar_today,
                    false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Lokasi Kembali
            const Text(
              "Lokasi Kembali",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: primaryMaroon, size: 30),
                const SizedBox(width: 8),
                const Text(
                  "Gedung A",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Memanggil _buildProductCard
            _buildProductCard(),
          ],
        ),
      ),
    );
  }

  // --- HELPER 1: STATUS TAG ---
  Widget _buildStatusTag(String status) {
    Color bgColor = status == "Dikembalikan"
        ? Colors.grey.shade600
        : (status == "Dipinjam" ? Colors.green : Colors.red);
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
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- HELPER 2: DATE INFO (Yang tadi error) ---
  Widget _buildDateInfo(String label, String date, IconData icon, bool isUp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(icon, color: primaryMaroon, size: 35),
                Positioned(
                  top: 0,
                  child: Icon(
                    isUp ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  // --- HELPER 3: PRODUCT CARD (Updated dengan tombol Lihat Detail) ---
  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.image, color: Colors.grey.shade400, size: 40),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama, // Nama barang otomatis sesuai data
                      style: TextStyle(
                        color: primaryMaroon,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "INV-ELK-001",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Tombol Lihat Detail
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: primaryMaroon,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Lihat Detail",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
