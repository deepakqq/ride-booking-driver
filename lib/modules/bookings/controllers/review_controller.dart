import 'package:get/get.dart';

class ReviewController extends GetxController {
  var driverRating = 0.obs;
  var carRating = 0.obs;
  var experience = ''.obs;

  void setDriverRating(int value) => driverRating.value = value;
  void setCarRating(int value) => carRating.value = value;
  void setExperience(String value) => experience.value = value;

  void submitReview() {
    print(
      "Driver: ${driverRating.value}, Car: ${carRating.value}, Exp: ${experience.value}",
    );
    // You can call API here or validate
  }
}
