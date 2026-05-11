import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta3/constants/app_color.dart';
import 'package:project_ta3/controlles/aduan_damage_controller.dart';

class TabButtonWidget extends StatelessWidget {
  final String label;
  final int index;
  final AduanDamageController controller;

  const TabButtonWidget({
    super.key,
    required this.label,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isActive = controller.selectedTab.value == index;

      return InkWell(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColor.primary : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.primary),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}