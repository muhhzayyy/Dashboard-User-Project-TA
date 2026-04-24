import 'package:get/get.dart';
import 'package:project_ta3/controlles/detail_kerusakan_controller.dart';
import 'package:project_ta3/controlles/home_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DetailKerusakanController>(() => DetailKerusakanController());
  }
}
