import 'package:get/get.dart';
import 'package:project_ta3/models/barang_models.dart';

class DashboardController extends GetxController {
  var listBarang = <BarangModel>[
    BarangModel(
      status: "Dikembalikan",
      kode: "#PJ-5001",
      nama: "Proyektor Epson EB-X400",
      tanggal: "25 Feb 2025",
    ),

    BarangModel(
      status: "Dipinjam",
      kode: "#PJ-5002",
      nama: "Karpet musholla",
      tanggal: "5 Mar 2025",
    ),

    BarangModel(
      status: "Terlambat",
      kode: "#PJ-5003",
      nama: "AC Portable 2 PK",
      tanggal: "1 Mar 2025",
    ),
  ].obs;
}
