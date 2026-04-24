import 'package:get/get.dart';
import '../pages/home_page.dart';
// Import page lain kalau sudah ada (misal inventory_page.dart)
// import '../pages/inventory_page.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
