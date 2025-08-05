import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileTypeScreen extends StatefulWidget {
  const ProfileTypeScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTypeScreen> createState() => _ProfileTypeScreenState();
}

class _ProfileTypeScreenState extends State<ProfileTypeScreen> {
  bool selected = false;
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            children: [
              AuthHeader(
                titleBig: false,
                showBackBtn: true,
                title: "Select Your Profile Type",
                subTitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              ),
              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onSelect(0);
                          authController.userType = UserType.driver;
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            l[0].selected
                                ? AppImages.pType1S
                                : AppImages.pType1,

                            height: Get.width * .35,
                          ),
                        ),
                      ),
                      AppSpacing.height8,
                      AppText(
                        text: l[0].type,
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  AppSpacing.width16,
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onSelect(1);
                          authController.userType = UserType.businessOwner;
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            l[1].selected
                                ? AppImages.pType2S
                                : AppImages.pType2,

                            height: Get.width * .35,
                          ),
                        ),
                      ),
                      AppSpacing.height8,
                      AppText(
                        text: l[1].type,
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(22.r),
        child: AppButton(
          text1: "Next",
          callback: () {
            Get.toNamed(AppRoutes.profileDetails);
            // print(authController.userType);
            // if (authController.userType == UserType.driver) {
            //   // Get.toNamed(AppRoutes.driverProfileDetailsScreen);
            //   Get.toNamed(AppRoutes.profileDetailsDriver);
            // }
          },
        ),
      ),
    );
  }

  onSelect(index) {
    print('object');
    for (var i = 0; i < l.length; i++) {
      l[i].selected = false;
    }
    l[index].selected = true;
    setState(() {});
  }

  List<ProfileTypeSelection> l = [
    ProfileTypeSelection(selected: false, type: "Individual"),
    ProfileTypeSelection(selected: false, type: "Business"),
  ];
}

class ProfileTypeSelection {
  String type;
  bool selected;
  ProfileTypeSelection({required this.selected, required this.type});
}

/*

Individual
Business
*/
