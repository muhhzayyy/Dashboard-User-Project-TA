import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/components/card/unit_card.dart';
import 'package:project_ta3/components/chip/unit_chip.dart';
import 'package:project_ta3/controlles/unit_controller.dart';
import 'package:project_ta3/routes/app_routes.dart';

class DetailBarangPage extends StatelessWidget {
  const DetailBarangPage({super.key});

  static const Color primaryMaroon = Color(0xFF8B1A1A);
  static const Color bgColor = Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailBarangController>();

    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final barang = controller.barang.value;
        if (barang == null) {
          return const Center(child: Text('Data tidak ditemukan'));
        }

        return CustomScrollView(
          slivers: [
            // ── AppBar dengan gambar + back + notif ──
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: primaryMaroon),
                onPressed: () => Get.back(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: primaryMaroon,
                  ),
                  onPressed: () => Get.toNamed(AppRoutes.notification),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  barang.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Info utama ──
                  Container(
                    color: bgColor,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama barang
                        Text(
                          barang.nama,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ID Inventaris
                        Row(
                          children: [
                            const Text(
                              'ID Inventaris  : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: primaryMaroon,
                              ),
                            ),
                            Text(
                              barang.idInventaris,
                              style: const TextStyle(
                                fontSize: 15,
                                color: primaryMaroon,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Unit Tersedia
                        Row(
                          children: [
                            const Text(
                              'Unit Tersedia  : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: primaryMaroon,
                              ),
                            ),
                            Text(
                              '${barang.unitTersedia}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: primaryMaroon,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Badge gudang & kategori
                        Row(
                          children: [
                            BadgeChip(
                              icon: Icons.location_on,
                              label: barang.gudang,
                            ),
                            const SizedBox(width: 10),
                            BadgeChip(label: barang.kategori),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1, color: Color(0xFFD9D9D9)),

                  // ── Description ──
                  Container(
                    color: bgColor,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          barang.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1, color: Color(0xFFD9D9D9)),

                  // ── Pilih Unit ──
                  Container(
                    color: bgColor,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pilih Unit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ...barang.listUnit.map(
                          (unit) => UnitCard(
                            unit: unit,
                            onTap: () => controller.pinjamUnit(unit),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
