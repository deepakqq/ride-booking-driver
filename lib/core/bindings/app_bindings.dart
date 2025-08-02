import 'package:annale_driver/modules/account/bindings/account_binding.dart';
import 'package:annale_driver/modules/auth/bindings/auth_bindings.dart';
import 'package:annale_driver/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:annale_driver/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    AuthBinding().dependencies();
    DashboardBinding().dependencies();
    AccountBinding().dependencies();
    OnboardingBinding().dependencies();
    // WalletBinding().dependencies();
    // RideBinding().dependencies();
  }
}
