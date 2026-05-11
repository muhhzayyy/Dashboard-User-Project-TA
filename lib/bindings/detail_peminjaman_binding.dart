import 'package:get/get.dart';
import 'package:project_ta3/controlles/detail_peminjaman_controller.dart';

class DetailPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPeminjamanController>(() => DetailPeminjamanController());
  }
}
