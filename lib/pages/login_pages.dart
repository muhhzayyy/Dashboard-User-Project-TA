import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/auth_controllers.dart';
import '../../components/button/default_button.dart';
import '../../components/textfield/login_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi Controller (GetX)
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 100),

              // Judul Login
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 60),

              // Input Email
              LoginTextField(
                hintText: 'example@gmail.com',
                prefixIcon: Icons.email_outlined,
                controller: authController.emailController,
              ),

              // Input Password (Bungkus Obx supaya fitur Mata jalan)
              Obx(
                () => LoginTextField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  isPassword: authController
                      .isObscure
                      .value, // Mengikuti status isObscure
                  controller: authController.passwordController,
                  // Menambahkan icon mata di sebelah kanan
                  suffixIcon: IconButton(
                    onPressed: () => authController.togglePasswordView(),
                    icon: Icon(
                      authController.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Tombol Login (Bungkus Obx supaya status Loading jalan)
              Obx(
                () => DefaultButton(
                  text: authController.isLoading.value ? 'Loading...' : 'Login',
                  onPressed: authController.isLoading.value
                      ? () {} // Fungsi kosong saat loading agar tidak double klik
                      : () {
                          authController.login();
                        },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
