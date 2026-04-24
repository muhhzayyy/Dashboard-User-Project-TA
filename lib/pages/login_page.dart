import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/login_controller.dart';
import '../components/button/default_button.dart';
import '../components/textfield/login_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Logo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 40),
              // Title
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 40),
              // Email Field
              LoginTextfield(
                hint: 'example@gmail.com',
                prefixIcon: Icons.email_outlined,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Password Field
              Obx(
                () => LoginTextfield(
                  hint: '··········',
                  prefixIcon: Icons.lock_outline,
                  controller: controller.passwordController,
                  isPassword: !controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Login Button
              Obx(
                () => DefaultButton(
                  text: controller.isLoading.value ? 'Loading...' : 'Login',
                  onPressed: controller.isLoading.value
                      ? () {}
                      : () => controller.login(),
                  fullWidth: true,
                ),
              ),
              const SizedBox(height: 24),
              // Forgot Password
              TextButton(
                onPressed: () {
                  Get.snackbar(
                    'Info',
                    'Hubungi admin untuk reset password',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text(
                  'Lupa Password?',
                  style: TextStyle(color: AppColors.primary, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
