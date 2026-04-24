import 'package:get/get.dart';
import 'app_routes.dart';

// Bindings
import '../bindings/main_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/detail_binding.dart';

// Pages
import '../pages/splash_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/home_page.dart';
import '../pages/detail_page.dart';
import '../pages/detail_kerusakan_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.barang,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // ✅ ROUTE DETAIL BARANG
    GetPage(
      name: AppRoutes.cardproduct,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    // ✅ ROUTE DETAIL KERUSAKAN
    GetPage(
      name: AppRoutes.detailKerusakan,
      page: () => const DetailKerusakanPage(),
      binding: DetailBinding(),
    ),
  ];
}
