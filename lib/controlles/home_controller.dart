import 'package:get/get.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final items = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      items.value = [
        {
          "id": "1",
          "code": "#PJ-5001",
          "name": "Proyektor Epson EB-X400",
          "status": "Dikembalikan",
          "date": "25 Feb 2025",
          "inventory": "INV-PRO-01",
        },
        {
          "id": "2",
          "code": "#PJ-5002",
          "name": "Karpet musholla",
          "status": "Dipinjam",
          "date": "5 Mar 2025",
          "inventory": "INV-KRP-02",
        },
        {
          "id": "3",
          "code": "#PJ-5003",
          "name": "AC Portable 2 PK",
          "status": "Terlambat",
          "date": "1 Mar 2025",
          "inventory": "INV-AC-03",
        },
      ];
    } catch (e) {
      Get.snackbar("Error", "Gagal ambil data");
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ METHOD INI UNTUK NAVIGATE KE DETAIL
  void navigateToDetail(item) {
    Get.toNamed(AppRoutes.cardproduct, arguments: item);
  }
}
