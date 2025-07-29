import 'package:get/get.dart';

class WalletController extends GetxController {
  final List<String> menuItems = ["Daily", "Weekly", "Monthly"];
  RxString selectedMenuItem = "Daily".obs;

  void onMenuItemSelected(String value) {
    selectedMenuItem.value = value;
  }
}
