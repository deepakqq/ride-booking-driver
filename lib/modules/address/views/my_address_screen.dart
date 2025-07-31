import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/address/views/add_edit_address.dart';
import 'package:annale_driver/modules/address/widgets/add_address_box.dart';
import 'package:annale_driver/modules/address/widgets/address_card.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "My Addresses".tr),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          AddressCard(
            title: '📍 ${"Home".tr}',
            address: '123, Near Green Valley, Delhi - 110001',
            // iconPath: 'assets/images/icons/home_icon.png',
            onEdit: () {
              // Handle edit
              Get.to(() => AddEditAddress(edit: true));
            },
            onDelete: () {
              // Handle delete
            },
          ),
          AppSpacing.height16,
          AddAddressBox(),
          AppSpacing.height16,
          AppText(
            text:
                "✨ ${"Easily book your rides faster with saved locations like home, work, or frequent destinations.".tr}",
            fontSize: 14.sp,
            align: TextAlign.center,
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
