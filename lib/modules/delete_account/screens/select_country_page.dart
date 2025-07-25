import '/core/theme/app_colors.dart';
import '/core/values/app_spacing.dart';
import '/modules/delete_account/controller/delete_controller.dart';
import '/modules/delete_account/widgets/select_country_widgets.dart';
import '/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class SelectCountryPage extends StatelessWidget {
  SelectCountryPage({super.key});
  final DeleteController countryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Choose A Country".tr,
        screenBGColor: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.h),
          child: Column(
            children: [
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                code: '+1',
                name: 'United States',
                onTap: () {
                  countryController.updateCountry('United States');
                  countryController.updateCountryCode('+1');
                  Get.back();
                },
              ),
              SizedBox(height: 10),
              SelectedCountryBox(
                images1: 'assets/images/flags/f-in.png',
                code: '+91',
                name: 'India',
                onTap: () {
                  countryController.updateCountry('India');
                  countryController.updateCountryCode('+91');
                  Get.back();
                },
              ),
              SizedBox(height: 10),
              SelectedCountryBox(
                images1: 'assets/images/flags/f-sa.png',
                code: '+27',
                name: 'South Africa',
                onTap: () {
                  countryController.updateCountry('South Africa');
                  countryController.updateCountryCode('+27');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-uk.png',
                code: '+44',
                name: 'United Kingdom',
                onTap: () {
                  countryController.updateCountry('United Kingdom');
                  countryController.updateCountryCode('+44');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-af.png',
                code: '+93',
                name: 'Afghanistan',
                onTap: () {
                  countryController.updateCountry('Afghanistan');
                  countryController.updateCountryCode('+93');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                code: '+088',
                name: 'Bangladesh',
                onTap: () {
                  countryController.updateCountry('Bangladesh');
                  countryController.updateCountryCode('+088');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                name: 'Japan',
                code: '+81',
                onTap: () {
                  countryController.updateCountry('Japan');
                  countryController.updateCountryCode('+81');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                name: 'Hong Kong',
                code: '+852',
                onTap: () {
                  countryController.updateCountry('Hong Kong');
                  countryController.updateCountryCode('+852');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                name: 'China',
                code: '+86',
                onTap: () {
                  countryController.updateCountry('China');
                  countryController.updateCountryCode('+86');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                name: 'Sri Lanka',
                code: '+94',
                onTap: () {
                  countryController.updateCountry('Sri Lanka');
                  countryController.updateCountryCode('+94');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                code: '+55',
                name: 'Brazil',
                onTap: () {
                  countryController.updateCountry('Brazil');
                  countryController.updateCountryCode('+55');
                  Get.back();
                },
              ),
              AppSpacing.height12,
              SelectedCountryBox(
                images1: 'assets/images/flags/f-usa.png',
                code: '+62',
                name: 'Malasiya',
                onTap: () {
                  countryController.updateCountry('Malasiya');
                  countryController.updateCountryCode('+62');
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
