import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/account/controllers/account_controller.dart';
import 'package:annale_driver/modules/account/views/edit_screen.dart';
import 'package:annale_driver/modules/account/widgets/account_option_tile.dart';
import 'package:annale_driver/modules/account/widgets/profile_info_tile.dart';

import 'package:annale_driver/modules/auth/views/change_password_screen.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:annale_driver/modules/delete_account/screens/deactive_page1.dart';
import 'package:annale_driver/modules/language/views/language_selection_screen.dart';
import 'package:annale_driver/modules/my%20rides/screens/my_vehicle_screen.dart';
import 'package:annale_driver/modules/notification_setting/views/notification_setting_screen.dart';
import 'package:annale_driver/modules/referral/views/referral_reward_screen.dart';
import 'package:annale_driver/modules/terms_condition/views/privacy_security_screen.dart';
import 'package:annale_driver/modules/terms_condition/views/tnc_screen.dart';

import 'package:annale_driver/widgets/popups/logout_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
    // final dashboardController = Get.find<DashboardController>();
    return Padding(
      padding: AppSpacing.horizontalLG,
      child: ListView(
        children: [
          AppSpacing.height16,
          ProfileInfoTile(
            name: "User Name",
            email: "user@name.com",
            phone: "9131318765",
            imagePath: AppImages.accountProfile,
            onEdit: () {
              Get.to(() => EditScreen());
            },
          ),
          AppSpacing.height16,
          Obx(() {
            return AccountOptionTile(
              title: "Change Mode".tr,
              leadingIconPath: AppImages.iconThemeMode,
              showSwitcher: true,
              isDarkMode: controller.isDarkMode.value,
              onToggle: (val) {
                controller.isDarkMode.value = val;
              },
            );
          }),
          AccountOptionTile(
            onTap: () {
              Get.to(() => MyVehicleScreen());
              // Get.to(() => MyAddressScreen());
              // dashboardController.currentIndex.value = 2;
            },
            title: "My Rides".tr,
            leadingIconPath: AppImages.iconMyRide,
          ),
          AccountOptionTile(
            onTap: () {
              // dashboardController.currentIndex.value = 2;
            },
            title: "Bank Accounts".tr,
            leadingIconPath: AppImages.iconBankAccount,
          ),
          AccountOptionTile(
            title: "My Address".tr,
            leadingIconPath: AppImages.iconAddress,
            onTap: () {
              // Get.to(() => MyAddressScreen());
              // dashboardController.currentIndex.value = 2;
            },
          ),
          AccountOptionTile(
            title: "Payment Methods".tr,
            leadingIconPath: AppImages.iconPayment,
            onTap: () {
              // Get.to(() => PaymentScreen());
            },
          ),
          AccountOptionTile(
            onTap: () {
              // Get.to(() => ChangePasswordScreen());
            },
            title: "Change Password".tr,
            leadingIconPath: AppImages.iconChagnePassword,
          ),
          AccountOptionTile(
            onTap: () {
              Get.to(() => LanguageSelectionScreen());
            },
            title: "Language".tr,
            leadingIconPath: AppImages.iconLanguage,
          ),
          AccountOptionTile(
            onTap: () {
              // dashboardController.currentIndex.value = 2;
            },
            title: "Wallet".tr,
            leadingIconPath: AppImages.iconWallet,
          ),
          AccountOptionTile(
            onTap: () {
              // Get.to(() => HelpSupportScreen());
            },
            title: "Help & Support".tr,
            leadingIconPath: AppImages.iconHelpSupport,
          ),
          AccountOptionTile(
            onTap: () {
              Get.to(() => ReferralsRewardsScreen());
            },
            title: "Referral and Loyalty".tr,
            leadingIconPath: AppImages.iconRefer,
          ),
          // NotificationSettingsScreen
          AccountOptionTile(
            onTap: () {
              // Get.to(() => HelpEmergencyScreen());
            },
            title: "Help & Emergency Contact".tr,
            leadingIconPath: AppImages.iconHelpEmergency,
          ),

          AccountOptionTile(
            onTap: () {
              // Get.to(() => HelpEmergencyScreen());
            },
            title: "Ratings Overview".tr,
            leadingIconPath: AppImages.iconRatinOverview,
          ),

          AccountOptionTile(
            onTap: () {
              Get.to(() => NotificationSettingsScreen());
            },
            title: "Notification Settings".tr,
            leadingIconPath: AppImages.iconSettingNotification,
          ),
          AccountOptionTile(
            onTap: () {
              Get.to(() => PrivacySecurityScreen());
            },
            title: "Privacy Security",
            leadingIconPath: AppImages.iconPrivacy,
          ),
          AccountOptionTile(
            onTap: () {
              Get.to(() => TncScreen());
            },
            title: "Terms & Conditions".tr,
            leadingIconPath: AppImages.iconTNC,
          ),
          AccountOptionTile(
            title: "Rate AnnAle on Store".tr,
            leadingIconPath: AppImages.iconRateStar,
          ),
          AccountOptionTile(
            onTap: () {
              Get.to(() => DeactivatePage1());
            },
            title: "Deactivate Account".tr,
            leadingIconPath: AppImages.iconDeleteAccount,
          ),
          AccountOptionTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => LogoutDialog(
                  onYesTap: () {
                    // call your logout function here
                    Get.back(); // Close dialog
                    // Navigate or clean user session
                  },
                ),
              );
            },
            title: "Logout".tr,
            leadingIconPath: AppImages.iconLogout,
          ),
        ],
      ),
    );
  }
}
