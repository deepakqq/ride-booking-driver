import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    print("UIFI ID ");
    currentIndex.value = index;
    print(index);
    print(currentIndex);
    update();
  }
}
