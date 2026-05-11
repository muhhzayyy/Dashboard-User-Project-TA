import 'package:get/get.dart';
import '../models/barang_models.dart';

class BarangController extends GetxController {
  // Data dummy sesuai BarangModel
  var listBarang = <BarangModel>[
    BarangModel(
      nama: "Camera canon g7x m5",
      stock: 5,
      lokasi: "Gudang A",
      kategori: "Fotografi",
      imageUrl: "assets/jacket.png",
      status: "Tersedia",
      kode: "CAM-01",
      tanggal: "20/05/2024",
    ),
    BarangModel(
      nama: "Background Kain Hitam",
      stock: 5,
      lokasi: "Gudang A",
      kategori: "Fotografi",
      status: "Tersedia",
      kode: "BGD-01",
      tanggal: "20/05/2024",
    ),
  ].obs;

  var categories = ["All", "Elektronik", "Fotografi", "Mesin"];
  var selectedCategory = "All".obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}