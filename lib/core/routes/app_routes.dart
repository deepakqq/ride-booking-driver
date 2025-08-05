import 'package:annale_driver/modules/account/bindings/account_binding.dart';
import 'package:annale_driver/modules/account/views/account_screen.dart';
import 'package:annale_driver/modules/auth/bindings/auth_bindings.dart';
import 'package:annale_driver/modules/auth/views/address_details_screen.dart';
import 'package:annale_driver/modules/auth/views/app_success_screen.dart';
import 'package:annale_driver/modules/auth/views/bank_account_details_screen.dart';
import 'package:annale_driver/modules/auth/views/business_details_screen.dart';
import 'package:annale_driver/modules/auth/views/change_password_screen.dart';
import 'package:annale_driver/modules/auth/views/document_upload_screen.dart';
import 'package:annale_driver/modules/auth/views/forgot_password_screen.dart';
import 'package:annale_driver/modules/auth/views/login_screen.dart';
import 'package:annale_driver/modules/auth/views/profile_details_screen.dart';
import 'package:annale_driver/modules/auth/views/profile_type_screen.dart';
import 'package:annale_driver/modules/auth/views/signup_screen.dart';
import 'package:annale_driver/modules/auth/views/verification_screen.dart';
import 'package:annale_driver/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:annale_driver/modules/dashboard/views/dashboard_screen.dart';
import 'package:annale_driver/modules/onboarding/views/onboarding_screen.dart';
import 'package:annale_driver/modules/splash/views/splash_screen.dart';
import 'package:annale_driver/modules/wallet/bindings/wallet_binding.dart';
import 'package:annale_driver/modules/wallet/views/wallets_screen.dart';
import 'package:get/get.dart';

/// 🔗 Route Names
class AppRoutes {
  // auth related
  static const String splash = '/splash';
  static const String onboarding = '/onbording';
  static const String login = '/login';
  static const String register = '/register';
  static const String profileType = '/profile-type';
  static const String verifyOtp = '/verify-top';
  static const String passwordChanged = '/password-changed';
  static const String addressDetails = '/address-details';
  static const String appSuccess = '/app-success';
  static const String bankAccountDetails = '/bank-account-details';
  static const String changePassword = '/change-password';
  static const String documentUpload = '/document-upload';
  static const String forgotPassword = '/forgot-password';
  static const String profileDetails = '/profile-details';
  static const String businessDetails = '/business-details';
  static const String verification = '/verification';

  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String rides = '/rides';
  static const String wallet = '/wallet';
  static const String account = '/account';

  // account
  static const String AccountScreen = '/account-screen';
}

/// 🌐 GetX Pages Configuration
class AppPages {
  static final routes = [
    // account related pages
    GetPage(
      name: AppRoutes.AccountScreen,
      page: () => AccountScreen(),
      transition: Transition.fadeIn,
      binding: AccountBinding(),
    ),
    // auth related pages
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () => const VerificationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.passwordChanged,
      page: () => ChangePasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.profileType,
      page: () => const ProfileTypeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.addressDetails,
      page: () => const AddressDetailsScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.appSuccess,
      page: () => AppSuccessScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.bankAccountDetails,
      page: () => const BankAccountDetailsScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.documentUpload,
      page: () => const DocumentUploadScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.profileDetails,
      page: () => const ProfileDetailsScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.businessDetails,
      page: () => const BusinessDetailsScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => const VerificationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
      // bindings: [DashboardBinding(), AccountBinding()],
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      // binding: DashboardBinding(),
    ),

    // Optional direct access
    GetPage(
      name: AppRoutes.wallet,
      page: () => const WalletsScreen(),
      binding: WalletBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.account,
    //   page: () => AccountScreen(),
    //   binding: AccountBinding(),
    // ),
  ];
}
