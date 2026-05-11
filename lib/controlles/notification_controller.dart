import 'package:flutter/material.dart';
import 'package:project_ta3/models/notification_model.dart';

class NotificationController extends ChangeNotifier {
  final List<NotificationItem> _items = [
    const NotificationItem(
      title: 'Peminjaman Disetujui',
      description:
          'Permintaan pinjam Camera canon g7x telah disetujui. Silakan ambil barang di Gudang A.',
      icon: Icons.inventory_2,
    ),
    const NotificationItem(
      title: 'Peminjaman Disetujui',
      description:
          'Permintaan pinjam Camera canon g7x telah disetujui. Silakan ambil barang di Gudang A.',
      icon: Icons.inventory_2,
    ),
    const NotificationItem(
      title: 'Peminjaman Disetujui',
      description:
          'Permintaan pinjam Camera canon g7x telah disetujui. Silakan ambil barang di Gudang A.',
      icon: Icons.inventory_2,
    ),
    const NotificationItem(
      title: 'Laporan Ditindak Lanjuti',
      description:
          'Permintaan pinjam Camera canon g7x telah disetujui. Silakan ambil barang di Gudang A.',
      icon: Icons.construction,
    ),
  ];

  List<NotificationItem> get items => List.unmodifiable(_items);

  void addItem(NotificationItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    _items.clear();
    notifyListeners();
  }
}
