import 'package:get/get.dart';

class ReportController extends GetxController {
  final activeTab = 0.obs; // 0 = Daftar Pinjaman, 1 = Daftar Laporan
  final borrowedItems = <Map<String, dynamic>>[].obs;
  final reportItems = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Dummy data daftar pinjaman
      borrowedItems.value = [
        {
          "id": "1",
          "code": "#PJ-5002",
          "name": "Karpet musholla",
          "date": "5 Mar 2025",
          "status": "Dipinjam",
          "statusColor": "green",
        },
        {
          "id": "2",
          "code": "#PJ-5003",
          "name": "Proyektor Epson EB-X400",
          "date": "10 Mar 2025",
          "status": "Dipinjam",
          "statusColor": "green",
        },
        {
          "id": "3",
          "code": "#PJ-5004",
          "name": "AC Portable 2 PK",
          "date": "1 Mar 2025",
          "status": "Terlambat",
          "statusColor": "red",
        },
      ];

      // Dummy data daftar laporan
      reportItems.value = [
        {
          "id": "1",
          "code": "#RJ-001",
          "name": "Kamera Canon G7X",
          "date": "15 Feb 2025",
          "damageType": "Pecah",
          "status": "Dalam Proses",
        },
        {
          "id": "2",
          "code": "#RJ-002",
          "name": "Laptop ASUS ROG",
          "date": "20 Feb 2025",
          "damageType": "Rusak Elektronik",
          "status": "Selesai",
        },
      ];
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat data");
    } finally {
      isLoading.value = false;
    }
  }

  void changeTab(int index) {
    activeTab.value = index;
  }

  void lihatDetail(Map<String, dynamic> item) {
    Get.snackbar(
      "Detail",
      "Melihat detail ${item['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
