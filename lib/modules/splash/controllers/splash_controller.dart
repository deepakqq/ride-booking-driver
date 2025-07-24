import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool startAnimation = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimationAfterDelay();
  }

  void startAnimationAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 400));
    startAnimation.value = true;

    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed('/onboarding'); // 👈 Change this to your next route
  }
}
