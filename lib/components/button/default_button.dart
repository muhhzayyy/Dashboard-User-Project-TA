import 'package:flutter/material.dart';
import 'package:project_ta3/constants/app_color.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // ✅ TAMBAH ? (nullable)
  final bool fullWidth;

  const DefaultButton({
    super.key,
    required this.text,
    this.onPressed, // ✅ Jadikan optional
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed, // ✅ Bisa null
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // ✅ Disable button saat onPressed null
          foregroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
