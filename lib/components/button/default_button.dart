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
<<<<<<< HEAD
    return SizedBox(
      width: fullWidth ? double.infinity : null,
=======
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
>>>>>>> 4c62efb (membetulkan ui)
      child: ElevatedButton(
        onPressed: onPressed, // ✅ Bisa null
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
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
=======
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          disabledBackgroundColor: AppColor.primary.withOpacity(0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
>>>>>>> 4c62efb (membetulkan ui)
          ),
        ),
      ),
    );
  }
}
