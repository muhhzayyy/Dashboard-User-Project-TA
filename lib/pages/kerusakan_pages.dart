import 'package:flutter/material.dart';

class KerusakanPage extends StatelessWidget {
  const KerusakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> laporan = [
      {
        "nama": "Camera canon g7x m5",
        "status": "Pending",
        "deskripsi": "Lensa error",
      },
      {
        "nama": "Karpet musholla",
        "status": "Selesai",
        "deskripsi": "Sudah diperbaiki",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kerusakan"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: laporan.length,
        itemBuilder: (context, index) {
          var item = laporan[index];

          Color statusColor = item["status"] == "Pending"
              ? Colors.orange
              : Colors.green;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border(left: BorderSide(color: Colors.red, width: 4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Status
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item["status"]!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 10),

                /// Nama Barang
                Text(
                  item["nama"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                /// Deskripsi
                Text(item["deskripsi"]!),
              ],
            ),
          );
        },
      ),
    );
  }
}
