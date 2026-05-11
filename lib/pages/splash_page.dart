import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Get.offAll(() => const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Box Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                size: 80,
                color: AppColors.primary,
=======
      body: Stack(
        children: [
          // Bagian Logo & Text (Tengah Layar)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/image.png', width: 150, height: 150),
                const SizedBox(height: 16),
                const Text(
                  "Login App",
                  style: TextStyle(
                    color: Color(0xFF8B1919),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Bagian Loading (Bawah Layar)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              // PERBAIKAN DI SINI: Gunakan .only
              padding: const EdgeInsets.only(bottom: 50),
              child: CircularProgressIndicator(
                color: AppColor.primary,
                strokeWidth: 3,
>>>>>>> 4c62efb (membetulkan ui)
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pinjam Barang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
