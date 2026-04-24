import 'package:get/get.dart';
import 'package:project_ta3/models/aduan_models.dart';
import 'package:project_ta3/models/peminjaman_models.dart';

class AduanDamageController extends GetxController {
  var selectedTab = 0.obs; // 0 untuk Pinjaman, 1 untuk Laporan

  // Data Dummy Pinjaman
  final listPinjaman = <PeminjamanModel>[
    PeminjamanModel(
      status: "Dipinjam",
      kodePinjam: "#PJ-5002",
      namaBarang: "Karpet musholla",
      tanggal: "5 Mar 2025",
    ),
    PeminjamanModel(
      status: "Dipinjam",
      kodePinjam: "#PJ-5003",
      namaBarang: "Kamera Canon",
      tanggal: "6 Mar 2025",
    ),
  ].obs;

  // Data Dummy Laporan
  final listAduan = <AduanModel>[
    AduanModel(
      status: "Pending",
      namaBarang: "Camera canon g7x m5",
      kodeInventaris: "INV-ELK-001",
      deskripsiAduan:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.....",
    ),
  ].obs;

  void changeTab(int index) => selectedTab.value = index;
}
