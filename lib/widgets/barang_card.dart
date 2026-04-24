import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ Tambahkan import Get
import 'package:project_ta3/models/barang_models.dart';
import '../controlles/barang_controller.dart'; // ✅ Tambahkan import controller

class BarangCard extends StatelessWidget {
  final BarangModel barang;

  const BarangCard({Key? key, required this.barang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🎨 Inisialisasi controller agar bisa dipanggil fungsinya
    final BarangController controller = Get.find<BarangController>();

    const Color primaryRed = Color(0xFF91282D);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ), // Sesuaikan radius agar lebih bulat seperti di foto
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Placeholder
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.image, color: Colors.grey, size: 40),
              ),
              SizedBox(width: 16),
              // Info Barang
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barang.nama,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryRed,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Stock Tersedia: ${barang.stock}",
                      style: TextStyle(color: primaryRed, fontSize: 14),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _buildChip(
                          Icons.location_on,
                          barang.lokasi,
                          primaryRed,
                        ),
                        SizedBox(width: 8),
                        _buildChip(null, barang.kategori, primaryRed),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // 🔘 TOMBOL PILIH UNIT
          SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              onPressed: () {
                // 🚀 Memanggil fungsi snackbar dari controller
                controller.pilihUnit(barang);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryRed, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "Pilih Unit",
                style: TextStyle(
                  color: primaryRed,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData? icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 14),
          if (icon != null) SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
