class UnitBarang {
  final String kodeUnit;
  final bool tersedia;

  const UnitBarang({required this.kodeUnit, required this.tersedia});
}

class DetailBarangModel {
  final String nama;
  final String idInventaris;
  final int unitTersedia;
  final String gudang;
  final String kategori;
  final String description;
  final String imageUrl;
  final List<UnitBarang> listUnit;

  const DetailBarangModel({
    required this.nama,
    required this.idInventaris,
    required this.unitTersedia,
    required this.gudang,
    required this.kategori,
    required this.description,
    required this.imageUrl,
    required this.listUnit,
  });
}
