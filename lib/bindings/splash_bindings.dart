import 'package:get/get.dart';
import 'package:project_ta3/controlles/splash_controllers.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
