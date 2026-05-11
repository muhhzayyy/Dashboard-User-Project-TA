import 'package:get/get.dart';
import 'package:project_ta3/controlles/unit_controller.dart';

class DetailBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBarangController>(() => DetailBarangController());
  }
}
