import 'package:get/get.dart';
import 'package:project_ta3/controlles/kerusakan_controller.dart';

class KerusakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KerusakanController>(() => KerusakanController());
  }
}
