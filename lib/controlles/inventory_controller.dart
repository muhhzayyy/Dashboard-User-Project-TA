import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  final searchController = TextEditingController();
  final selectedCategory = 'All'.obs;
  final items = <Map<String, dynamic>>[].obs;
  final filteredItems = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  final categories = ['All', 'Elektronik', 'Fotografi', 'Mesin', 'Lainnya'].obs;

  @override
  void onInit() {
    super.onInit();
    fetchInventory();
    searchController.addListener(_filterItems);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchInventory() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Dummy data inventory
      items.value = [
        {
          "id": "1",
          "name": "Camera canon g7x m5",
          "stock": 5,
          "location": "Gudang A",
          "category": "Fotografi",
          "image": "assets/images/camera.jpg", // nanti ganti dengan gambar asli
          "hasImage": true,
        },
        {
          "id": "2",
          "name": "Background Kain Hitam",
          "stock": 5,
          "location": "Gudang A",
          "category": "Fotografi",
          "image": "",
          "hasImage": false,
        },
        {
          "id": "3",
          "name": "Proyektor Epson EB-X400",
          "stock": 3,
          "location": "Gudang B",
          "category": "Elektronik",
          "image": "",
          "hasImage": false,
        },
        {
          "id": "4",
          "name": "Laptop ASUS ROG",
          "stock": 10,
          "location": "Gudang A",
          "category": "Elektronik",
          "image": "",
          "hasImage": false,
        },
        {
          "id": "5",
          "name": "Mesin Jahit Portable",
          "stock": 2,
          "location": "Gudang C",
          "category": "Mesin",
          "image": "",
          "hasImage": false,
        },
      ];

      filteredItems.value = items;
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat data inventory");
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    _filterItems();
  }

  void _filterItems() {
    String query = searchController.text.toLowerCase();
    String category = selectedCategory.value;

    filteredItems.value = items.where((item) {
      bool matchesSearch = item['name'].toLowerCase().contains(query);
      bool matchesCategory = category == 'All' || item['category'] == category;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void pilihUnit(Map<String, dynamic> item) {
    Get.snackbar(
      "Pilih Unit",
      "Memilih ${item['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Nanti navigate ke halaman pilih unit/peminjaman
  }
}
