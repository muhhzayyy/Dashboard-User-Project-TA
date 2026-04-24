import 'package:get/get.dart';
import 'package:project_ta3/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _goToNextPage();
  }

  void _goToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // sementara langsung ke login
    Get.offAllNamed(AppRoutes.login);

    // NANTI kalau ada login session:
    // if (sudahLogin) {
    //   Get.offAllNamed(AppRoutes.dashboard);
    // } else {
    //   Get.offAllNamed(AppRoutes.login);
    // }
  }
}
