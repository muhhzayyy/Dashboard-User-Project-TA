import 'package:get/get.dart';
import 'package:project_ta3/controlles/home_controller.dart';
import 'package:project_ta3/controlles/inventory_controller.dart';
import 'package:project_ta3/controlles/main_controller.dart';
import 'package:project_ta3/controlles/profile_controller.dart';
import 'package:project_ta3/controlles/report_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<InventoryController>(
      () => InventoryController(),
    ); // ✅ Inject controller
    Get.lazyPut<ReportController>(() => ReportController());
    Get.lazyPut<ProfileController>(() => ProfileController()); // ✅ Inject
  }
}
