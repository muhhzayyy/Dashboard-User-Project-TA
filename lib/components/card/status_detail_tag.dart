import 'package:flutter/material.dart';

class StatusTagWidget extends StatelessWidget {
  final String status;

  const StatusTagWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor = status == "Dikembalikan"
        ? Colors.grey.shade600
        : (status == "Dipinjam" ? Colors.green : Colors.red);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
