import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:project_ta3/bindings/barang_binding.dart';
import 'package:project_ta3/bindings/notification_binding.dart';
import 'package:project_ta3/bindings/splash_bindings.dart';
import 'package:project_ta3/bindings/unit_binding.dart';
import 'package:project_ta3/pages/barang_pages.dart';
import 'package:project_ta3/pages/dashboard_pages.dart';
import 'package:project_ta3/pages/detail_kerusakan_pages.dart';
import 'package:project_ta3/pages/nav_pages.dart';
import 'package:project_ta3/pages/notification_page.dart';
import 'package:project_ta3/pages/splash_page.dart';
import 'package:project_ta3/pages/login_pages.dart';
import 'package:project_ta3/pages/unit_page.dart';
>>>>>>> 4c62efb (membetulkan ui)
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
<<<<<<< HEAD
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
=======

    /// Dashboard
    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage()),

    /// Main Nav
    GetPage(name: AppRoutes.mainNav, page: () => MainNavPage()),

    /// Barang Page
    GetPage(name: AppRoutes.barang, page: () => BarangPage()),
    GetPage(
      name: AppRoutes.detailKerusakan,
      page: () =>
          const DetailKerusakanPage(), // ✅ Pastikan class ini sudah di-import
      transition:
          Transition.rightToLeft, // Opsional: animasi perpindahan halaman
>>>>>>> 4c62efb (membetulkan ui)
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.barang,
      page: () => BarangPage(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: AppRoutes.detailBarang,
      page: () => const DetailBarangPage(),
      binding: DetailBarangBinding(),
),
  ];
}
