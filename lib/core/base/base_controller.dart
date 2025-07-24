// lib/core/base/base_controller.dart
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  RxBool isLoading = false.obs;
  Rx<T?> data = Rx<T?>(null);
  RxString error = ''.obs;

  void startLoading() {
    isLoading.value = true;
    error.value = '';
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void setError(String message) {
    error.value = message;
  }

  void setData(T value) {
    data.value = value;
  }
}
