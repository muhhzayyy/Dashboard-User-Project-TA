import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';

import '../components/card/info_section.dart';
import '../components/card/product_card.dart';
import '../components/card/status_tag.dart';

class DetailKerusakanPage extends StatelessWidget {
  const DetailKerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.primary),
          onPressed: () => Get.back(),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColor.primary),
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

            // STATUS & KODE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const StatusTag(status: "Dipinjam"),

                const Text(
                  "#PJ-5001",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // TANGGAL
            Row(
              children: const [
                Expanded(
                  child: InfoSection(
                    label: "Tgl Peminjaman",
                    content: "1 Mar 2025",
                    icon: Icons.calendar_today_outlined,
                  ),
                ),

                Expanded(
                  child: InfoSection(
                    label: "Tgl Pengembalian",
                    content: "5 Mar 2025",
                    icon: Icons.calendar_today_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // LOKASI
            const InfoSection(
              label: "Lokasi Kembali",
              content: "Gedung A",
              icon: Icons.location_on_outlined,
            ),

            const SizedBox(height: 30),

            // CARD BARANG
            const ProductCard(),

            const SizedBox(height: 30),

            // BUTTON
            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {},

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColor.primary),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                child: const Text(
                  "Adukan Kerusakan",
                  style: TextStyle(
                    color: AppColor.primary,
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
}
