import 'package:flutter/material.dart';

class DateInfoWidget extends StatelessWidget {
  final String label;
  final String date;
  final IconData icon;
  final bool isUp;

  const DateInfoWidget({
    super.key,
    required this.label,
    required this.date,
    required this.icon,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryMaroon = Color(0xFF8B1A1A);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Stack(
              alignment: Alignment.center,

              children: [
                Icon(icon, color: primaryMaroon, size: 35),

                Positioned(
                  top: 0,

                  child: Icon(
                    isUp ? Icons.arrow_upward : Icons.arrow_downward,

                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 8),

            Text(
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
