import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/routes/app_pages.dart';
import 'package:project_ta3/routes/app_routes.dart';

void main() async {
  // Pastikan binding Flutter sudah siap
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pinjam Barang',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        // Optional: Set primary color globally
        primarySwatch: Colors.green,
      ),
      // ✅ Route awal
      initialRoute: AppRoutes.splash,
      // ✅ Daftar halaman
      getPages: AppPages.pages,
    );
  }
}
