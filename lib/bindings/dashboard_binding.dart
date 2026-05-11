import 'package:get/get.dart';
import 'package:project_ta3/controlles/dashboard_controllers.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
