import 'package:get/get.dart';
import 'package:project_ta3/models/unit_model.dart';

class DetailBarangController extends GetxController {
  final Rx<DetailBarangModel?> barang = Rx<DetailBarangModel?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Ambil argument yang dikirim dari halaman sebelumnya
    final args = Get.arguments;
    if (args != null && args is DetailBarangModel) {
      barang.value = args;
    } else {
      _loadDummyData();
    }
    isLoading.value = false;
  }

  void _loadDummyData() {
    barang.value = DetailBarangModel(
      nama: 'Camera canon g7x m5',
      idInventaris: 'SCH-ELC-001',
      unitTersedia: 2,
      gudang: 'Gudang A',
      kategori: 'Fotografi',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      imageUrl: 'https://via.placeholder.com/400x300',
      listUnit: const [
        UnitBarang(kodeUnit: 'SCH-ELC-001-1', tersedia: true),
        UnitBarang(kodeUnit: 'SCH-ELC-001-1', tersedia: false),
      ],
    );
  }

  void pinjamUnit(UnitBarang unit) {
    if (!unit.tersedia) return;
    // TODO: Tambahkan logic API pinjam barang
    Get.snackbar(
      'Berhasil',
      'Unit ${unit.kodeUnit} berhasil dipinjam',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
