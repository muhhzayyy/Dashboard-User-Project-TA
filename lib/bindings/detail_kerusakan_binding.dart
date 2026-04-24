import 'package:get/get.dart';
import 'package:project_ta3/controlles/detail_kerusakan_controller.dart';

class DetailKerusakanBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Pastikan controller di-inject dengan benar
    Get.lazyPut<DetailKerusakanController>(() => DetailKerusakanController());
  }
}
