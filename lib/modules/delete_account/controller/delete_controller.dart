import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeleteController extends GetxController {
  var selectedCountry = 'United States'.obs;
  var selectNumber = '9090909090'.obs;
  var selectedCountryCode = '+1'.obs;
  var relationship = ''.obs;
  void updateCountry(String country) {
    selectedCountry.value = country;
  }

  void updateCountryCode(String code) {
    selectedCountryCode.value = code;
  }

  void resetAll() {
    print('resetAll called');
    selectedCountry.value = 'United States';
    selectNumber.value = 'Phone Number';
    selectedCountryCode.value = '+1';
  }
}
