import 'package:get/get.dart';

enum RouteName { tv, best, dance, stage }

class AppController extends GetxController {
  RxBool darkMode = true.obs;
  RxBool gridView = false.obs;
  RxInt currentIndex = 0.obs;
  RxString viewMode = 'gridView'.obs;

  void toggleViewMode() {
    gridView(!gridView.value);
  }

  void changeTheme() {
    darkMode(!darkMode.value);
  }

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
