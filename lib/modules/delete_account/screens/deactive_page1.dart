import '/core/theme/app_colors.dart';
import '/core/values/app_spacing.dart';
import '/modules/delete_account/controller/delete_controller.dart';
import '/modules/delete_account/screens/deactivate_reason.dart';
import '/modules/delete_account/screens/select_country_page.dart';
import '/modules/delete_account/widgets/delete_account_btn.dart';
import '/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';

class DeactivatePage1 extends StatelessWidget {
  final DeleteController countryController = Get.put(DeleteController());

  DeactivatePage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(
        title: "Deactivate Account".tr,
        screenBGColor: true,
      ),
      backgroundColor: AppColors.screenBG,
      body: SafeArea(
        // padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20,
            bottom: 10,
            top: 24.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'To deactivate your account,confirm your country code and enter your phone number.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Color(0xff000000)),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SelectCountryPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Obx(
                          () => Container(
                            alignment: Alignment.center,
                            child: Text(
                              countryController.selectedCountry.value,
                              style: TextStyle(
                                fontSize: 14,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                    color: Color(0xff000000),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppSpacing.height12,

              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        height: 35.h,
                        width: 100.w,
                        child: Text(
                          countryController.selectedCountryCode.value,
                        ),
                      ),
                    ),
                    AppSpacing.width16,

                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration.collapsed(hintText: ""),
                          onChanged: (value) {
                            countryController.selectNumber.value = value;
                          },
                          textAlign: TextAlign.left,

                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              GestureDetector(
                onTap: () {
                  Get.to(() => DeactivateReason());
                },

                child: DeleteAccountBtn(),
              ),
              AppSpacing.height30,
            ],
          ),
        ),
      ),
    );
  }
}
