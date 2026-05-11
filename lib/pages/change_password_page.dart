import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/components/appbar/appbar.dart';
import 'package:project_ta3/components/button/password_button.dart';
import 'package:project_ta3/components/textfield/cp_textfield.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/change_password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        title: "Ganti Password",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Password Lama ──
              Obx(
                () => PasswordTextField(
                  controller: controller.oldPasswordController,
                  hintText: "Password Lama",
                  isObscure: controller.isOldPasswordObscure.value,
                  onToggleVisibility: controller.toggleOldPasswordVisibility,
                  margin: const EdgeInsets.only(bottom: 16),
                ),
              ),

              // ── Password Baru ──
              Obx(
                () => PasswordTextField(
                  controller: controller.newPasswordController,
                  hintText: "Password Baru",
                  isObscure: controller.isNewPasswordObscure.value,
                  onToggleVisibility: controller.toggleNewPasswordVisibility,
                  margin: const EdgeInsets.only(bottom: 35),
                ),
              ),

              // ── Tombol Ganti Password ──
              BigButton(
                title: "Ganti Password",
                onTap: controller.changePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
