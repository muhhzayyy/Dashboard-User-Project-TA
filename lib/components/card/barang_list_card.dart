import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/components/chip/barang_list_chip.dart';
import 'package:project_ta3/models/barang_models.dart';
import 'package:project_ta3/routes/app_routes.dart';

class BarangListCard extends StatelessWidget {
  final BarangModel item;

  const BarangListCard({
    super.key,
    required this.item,
  });

  static const Color primaryMaroon = Color(0xFF8B1A1A);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // ── Info barang ──
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: item.imageUrl != null
                      ? Image.network(
                          item.imageUrl!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _placeholderImage(),
                        )
                      : _placeholderImage(),
                ),

                const SizedBox(width: 14),

                // Detail
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama
                      Text(
                        item.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryMaroon,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Stock
                      Text(
                        'Stock Tersedia: ${item.stock ?? 0}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Badge gudang & kategori
                      Row(
                        children: [
                          BarangListCardChip(
                            icon: Icons.location_on,
                            label: item.lokasi ?? '-',
                          ),
                          const SizedBox(width: 8),
                          BarangListCardChip(
                            label: item.kategori ?? '-',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Tombol Pilih Unit ──
          GestureDetector(
            onTap: () => Get.toNamed(
              AppRoutes.detailBarang,
              arguments: item,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: const Center(
                child: Text(
                  'Pilih Unit',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: primaryMaroon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.image, size: 40, color: Colors.grey),
    );
  }
}