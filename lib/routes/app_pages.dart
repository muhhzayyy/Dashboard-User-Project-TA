import 'package:get/get.dart';
import 'package:project_ta3/bindings/splash_bindings.dart';
import 'package:project_ta3/pages/barang_pages.dart';
import 'package:project_ta3/pages/dashboard_pages.dart';
import 'package:project_ta3/pages/detail_kerusakan_pages.dart';
import 'package:project_ta3/pages/nav_pages.dart';
import 'package:project_ta3/pages/splash_page.dart';
import 'package:project_ta3/pages/login_pages.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    /// Splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    /// Login
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),

    /// Dashboard
    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage()),

    /// Main Nav
    GetPage(name: AppRoutes.mainNav, page: () => MainNavPage()),

    /// Barang Page
    GetPage(name: AppRoutes.barang, page: () => BarangPage()),

    /// Detail Kerusakan (🔥 TAMBAH INI)
    GetPage(
      name: AppRoutes.detailKerusakan,
      page: () => const DetailKerusakanPage(),
      transition:
          Transition.rightToLeft, // Opsional: tambah animasi biar lebih smooth
    ),
    GetPage(
      name: AppRoutes.detailKerusakan,
      page: () =>
          const DetailKerusakanPage(), // ✅ Pastikan class ini sudah di-import
      transition:
          Transition.rightToLeft, // Opsional: animasi perpindahan halaman
    ),
  ];
}
