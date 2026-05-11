import 'package:flutter/material.dart';
import 'package:project_ta3/models/barang_models.dart';

class ProductCardPeminjaman extends StatelessWidget {
  final BarangModel item;

  const ProductCardPeminjaman({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const Color primaryMaroon = Color(0xFF8B1A1A);

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
                      item.nama,
                      style: const TextStyle(
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

          // BUTTON
          Container(
            width: double.infinity,

            padding: const EdgeInsets.symmetric(vertical: 12),

            decoration: BoxDecoration(
              color: primaryMaroon,
              borderRadius: BorderRadius.circular(10),
            ),

            child: const Center(
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
