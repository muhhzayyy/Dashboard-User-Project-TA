import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/models/barang_models.dart';
import '../../pages/detail_peminjaman.dart';

class BarangCard extends StatelessWidget {
  final BarangModel item;

  const BarangCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Gunakan warna maroon yang konsisten
    const Color primaryMaroon = Color(0xFF8B1A1A);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2), // Background abu muda seperti di gambar
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Bagian Foto / Gambar
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
                        child: Image.network(
                          item.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_outlined, color: Colors.grey),
                        ),
                      )
                    : const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
              ),
              const SizedBox(width: 15),

              // 2. Bagian Detail (Nama, Stock, Badge)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryMaroon,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Stock Tersedia: ${item.stock ?? 0}",
                      style: const TextStyle(
                        color: primaryMaroon,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Row untuk Badge Gudang & Kategori
                    Row(
                      children: [
                        _buildBadge(Icons.location_on, item.lokasi ?? "N/A"),
                        const SizedBox(width: 6),
                        _buildBadge(null, item.kategori ?? "Umum"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 3. Button Pilih Unit / Lihat Detail
          SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => DetailPeminjamanPage(item: item));
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primaryMaroon, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                "Pilih Unit",
                style: TextStyle(
                  color: primaryMaroon,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk Badge (Gudang & Kategori)
  Widget _buildBadge(IconData? icon, String label) {
    const Color primaryMaroon = Color(0xFF8B1A1A);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryMaroon,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}