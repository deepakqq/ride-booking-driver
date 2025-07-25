import '/core/theme/app_colors.dart';
import '/core/values/app_images.dart';
import '/core/values/app_spacing.dart';
import '/modules/delete_account/controller/delete_controller.dart';
import '/modules/delete_account/screens/deactive_page1.dart';
import '/modules/delete_account/widgets/delete_account_btn.dart';
import '/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:myprojectnewgreen/modules/deactivate_account_box/controllers/country_controller.dart';
// import 'package:myprojectnewgreen/modules/deactivate_account_box/deact_account_container.dart';
// import 'package:myprojectnewgreen/modules/deactivate_account_box/deactivate_page1.dart';

class DeactivateLastpage extends StatelessWidget {
  DeactivateLastpage({super.key});

  final DeleteController countryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Deactivate Account".tr,
        screenBGColor: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Center(
                  child: Image.asset(
                    AppImages.imageDeleteAccount,
                    height: 150.h,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 130),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(countryController.selectedCountryCode.value),
                      ),
                      Obx(() => Text(countryController.selectNumber.value)),
                    ],
                  ),
                ),
                Text('Proceed to deactive this account'.tr),

                SizedBox(height: 380),
                GestureDetector(
                  onTap: () async {
                    countryController.resetAll();
                    Get.off(() => DeactivatePage1());
                  },

                  child: DeleteAccountBtn(),
                ),
                AppSpacing.height30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
