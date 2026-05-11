class BarangModel {
  final String status;
  final String kode;
  final String nama;
  final String tanggal;

  final String? kategori;
  final int? stock;
  final String? lokasi;
  final String? imageUrl;

  BarangModel({
    required this.status,
    required this.kode,
    required this.nama,
    required this.tanggal,
    this.kategori,
    this.stock,
    this.lokasi,
    this.imageUrl,
  });
}
