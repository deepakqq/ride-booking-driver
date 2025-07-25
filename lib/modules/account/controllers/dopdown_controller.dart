import 'package:get/get.dart';

// class DropdownController extends GetxController {
//   var selectedItem = 'Female'.obs;
//   var isDropdownOpen = false.obs;

//   final List<String> items = ['Female', 'Male', 'Other'];

//   void toggleDropdown() {
//     isDropdownOpen.value = !isDropdownOpen.value;
//   }

//   void selectItem(String item) {
//     selectedItem.value = item;
//     isDropdownOpen.value = false;
//   }
// }
class DropdownController extends GetxController {
  var selectedItem = 'Female'.obs;
  var isDropdownOpen = false.obs;

  final List<String> items = ['Female', 'Male', 'Other'];

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  void selectItem(String item) {
    selectedItem.value = item;
    isDropdownOpen.value = false; // यहाँ dropdown बंद हो जाएगा
    update(); // यदि GetBuilder का उपयोग कर रहे हों तो
  }
}
