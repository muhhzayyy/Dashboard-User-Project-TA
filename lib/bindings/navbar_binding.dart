import 'package:get/get.dart';
import 'package:project_ta3/controlles/nav_controllers.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController());
  }
}
