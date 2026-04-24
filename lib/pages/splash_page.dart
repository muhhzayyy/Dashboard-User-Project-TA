import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/controlles/splash_controllers.dart';
import '../constants/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
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
                color: AppColors.primary,
                strokeWidth: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
