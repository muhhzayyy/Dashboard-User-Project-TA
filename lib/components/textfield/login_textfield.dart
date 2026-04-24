import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),

          // 🔴 ICON KIRI
          prefixIcon: Icon(prefixIcon, color: const Color(0xFF8B1E1E)),

          // 👁 ICON KANAN (PASSWORD)
          suffixIcon: suffixIcon,

          filled: true,
          fillColor: Colors.white,

          // 🔥 Padding biar tinggi seperti gambar
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 10,
          ),

          // 🔴 BORDER NORMAL
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF8B1E1E), width: 1.5),
          ),

          // 🔴 BORDER SAAT DIKLIK
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF8B1E1E), width: 2),
          ),

          // 🔴 BORDER DEFAULT (backup)
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
