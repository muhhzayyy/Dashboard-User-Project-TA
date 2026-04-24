import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/models/barang_models.dart';

class BarangController extends GetxController {
  // 🎨 Definisikan warna tema agar konsisten
  final Color primaryRed = Color(0xFF91282D);

  // Reactive variables
  var selectedCategory = 'All'.obs;
  var searchQuery = ''.obs;

  // Data list
  final RxList<BarangModel> listBarang = <BarangModel>[
    BarangModel(
      status: "Tersedia",
      kode: "#INV-001",
      nama: "Camera Canon G7X M5",
      tanggal: "-",
      kategori: "Fotografi",
      stock: 5,
      lokasi: "Gudang A",
    ),
    BarangModel(
      status: "Tersedia",
      kode: "#INV-002",
      nama: "Background Kain Hitam",
      tanggal: "-",
      kategori: "Fotografi",
      stock: 5,
      lokasi: "Gudang A",
    ),
    BarangModel(
      status: "Dipinjam",
      kode: "#PJ-5001",
      nama: "Laptop ASUS ROG",
      tanggal: "10 Mar 2025",
      kategori: "Elektronik",
      stock: 0,
      lokasi: "Gudang B",
    ),
    BarangModel(
      status: "Tersedia",
      kode: "#INV-003",
      nama: "Proyektor Epson",
      tanggal: "-",
      kategori: "Elektronik",
      stock: 2,
      lokasi: "Gudang A",
    ),
  ].obs;

  // List kategori
  final categories = ['All', 'Elektronik', 'Fotografi', 'Mesin', 'Lainnya'].obs;

  // Getter filter
  List<BarangModel> get filteredBarang {
    List<BarangModel> result = listBarang.toList();

    // Filter kategori
    if (selectedCategory.value != 'All') {
      result = result
          .where((item) => item.kategori == selectedCategory.value)
          .toList();
    }

    // Filter search
    if (searchQuery.value.isNotEmpty) {
      result = result
          .where(
            (item) => item.nama.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            ),
          )
          .toList();
    }

    return result;
  }

  // Actions
  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void pilihUnit(BarangModel barang) {
    if (barang.stock > 0) {
      Get.snackbar(
        'Berhasil',
        'Memilih ${barang.nama}',
        backgroundColor: primaryRed, // ✅ Ganti ke merah marun sesuai foto
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(15),
      );
    } else {
      Get.snackbar(
        'Stok Habis',
        '${barang.nama} tidak tersedia',
        backgroundColor: Colors.black87, // Hitam agar kontras dengan error
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(15),
      );
    }
  }

  void resetFilter() {
    selectedCategory.value = 'All';
    searchQuery.value = '';
  }
}
