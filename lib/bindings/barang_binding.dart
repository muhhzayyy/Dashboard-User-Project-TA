import 'package:get/get.dart';
import 'package:project_ta3/controlles/barang_controller.dart';

class BarangBinding extends Bindings {
  @override
  void dependencies() {
    // Menggunakan Get.lazyPut agar controller hanya dibuat saat halaman dibuka
    Get.lazyPut<BarangController>(() => BarangController());
  }
}