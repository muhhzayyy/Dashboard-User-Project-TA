import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ TAMBAHKAN INI
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/models/peminjaman_models.dart';
import 'package:project_ta3/routes/app_routes.dart'; // ✅ TAMBAHKAN INI

class DamageReportCard extends StatelessWidget {
  const DamageReportCard({super.key, required PeminjamanModel data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: AppColor.primary, width: 6),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.success,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Dipinjam',
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  '#PJ-5002',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Karpet musholla',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: AppColor.primary,
                ),
                SizedBox(width: 4),
                Text('5 Mar 2025', style: TextStyle(color: AppColor.blacktext)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // ✅ GANTI KODE KOSONG TADI DENGAN INI
                  Get.toNamed(AppRoutes.detailKerusakan);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColor.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
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
