import 'package:get/get.dart';
import 'package:project_ta3/controlles/aduan_damage_controller.dart';

class LaporKerusakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AduanDamageController>(() => AduanDamageController());
  }
}
