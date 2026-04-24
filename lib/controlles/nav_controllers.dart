import 'package:get/get.dart';

class MainNavController extends GetxController {
  // .obs membuat variabel ini reaktif
  var currentIndex = 0.obs;

  // Fungsi untuk berpindah halaman
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
