import 'package:flutter/material.dart';
import 'package:project_ta3/constants/app_color.dart';

class InfoSection extends StatelessWidget {
  final String label;
  final String content;
  final IconData icon;

  const InfoSection({
    super.key,
    required this.label,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Icon(icon, color: AppColor.primary, size: 26),

        const SizedBox(width: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              label,
              style: const TextStyle(color: AppColor.greyText, fontSize: 13),
            ),

            const SizedBox(height: 4),

            Text(
              content,
              style: const TextStyle(
                color: AppColor.blacktext,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
