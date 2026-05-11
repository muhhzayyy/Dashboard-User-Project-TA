import 'package:flutter/material.dart';
import 'package:project_ta3/models/unit_model.dart';

class UnitCard extends StatelessWidget {
  final UnitBarang unit;
  final VoidCallback onTap;

  const UnitCard({super.key, required this.unit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Icon tag ──
          Icon(Icons.sell_outlined, color: Colors.grey.shade400, size: 24),

          const SizedBox(width: 12),

          // ── Kode unit ──
          Expanded(
            child: Text(
              unit.kodeUnit,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          // ── Badge status ──
          GestureDetector(
            onTap: unit.tersedia ? onTap : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: unit.tersedia
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                unit.tersedia ? 'Tersedia' : 'Dipinjam',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
