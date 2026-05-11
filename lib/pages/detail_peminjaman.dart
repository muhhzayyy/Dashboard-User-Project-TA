import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/models/barang_models.dart';
import 'package:project_ta3/components/card/card_peminjaman.dart';
import 'package:project_ta3/components/card/status_detail_tag.dart';
import '../components/card/date_info_widget.dart';

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
            // STATUS & KODE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                StatusTagWidget(status: item.status),

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

            // TANGGAL
            Row(
              children: [
                Expanded(
                  child: DateInfoWidget(
                    label: "Tgl Pinjam",
                    date: item.tanggal,
                    icon: Icons.calendar_today,
                    isUp: true,
                  ),
                ),

                Expanded(
                  child: DateInfoWidget(
                    label: "Tgl Kembali",
                    date: "-",
                    icon: Icons.calendar_today,
                    isUp: false,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // LOKASI
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

            // PRODUCT CARD
            ProductCardPeminjaman(item: item),
          ],
        ),
      ),
    );
  }
}
