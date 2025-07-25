import '/core/theme/app_colors.dart';
import '/core/values/app_spacing.dart';
import '/modules/delete_account/controller/delete_controller.dart';
import '/modules/delete_account/screens/deactive_last_page.dart';
import '/modules/delete_account/widgets/delete_account_btn.dart';
import '/modules/delete_account/widgets/delete_account_dropdown.dart';
import '/widgets/app_dropdown.dart';
import '/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class DeactivateReason extends StatelessWidget {
  const DeactivateReason({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Deactivate Account".tr,
        screenBGColor: true,
      ),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpacing.height16,
            Text(
              'We hate to see you leave! Tell us why you are deleting your account:'
                  .tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),

            DeleteAccountDropdown(
              backgroundTrans: true,
              title: "",
              hintText: "Select a reason".tr,
              items: [
                'I am changing my device'.tr,
                'I am changing my phone number'.tr,
                'I am deactivate my account temporarily'.tr,
                'AnnAle is missing a feature'.tr,
                'AnnAle is not working'.tr,
                'Other'.tr,
              ],
              getLabel: (val) => val,
              value: controller.relationship.value.isNotEmpty
                  ? controller.relationship.value
                  : null,
              onChanged: (val) => controller.relationship.value = val ?? '',
            ),
            SizedBox(height: 2),

            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'How can we improve? (optional)'.tr,
              ),
            ),
            Container(height: 2, color: Color(0xff000000)),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Get.to(() => DeactivateLastpage());
              },

              child: DeleteAccountBtn(),
            ),
            AppSpacing.height30,
          ],
        ),
      ),
    );
  }
}
