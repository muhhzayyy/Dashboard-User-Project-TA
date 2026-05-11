import 'package:flutter/material.dart';
import 'package:project_ta3/constants/app_color.dart';

class StatusTag extends StatelessWidget {
  final String status;

  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: AppColor.success,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        status,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
