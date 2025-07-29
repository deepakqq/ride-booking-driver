import 'package:annale_driver/core/theme/app_box_decoration.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/views/select_card_to_pay.dart';
import 'package:annale_driver/modules/wallet/widgets/amount_option_tile.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddBalanceScreen extends StatelessWidget {
  const AddBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(title: "Add Balance".tr, screenBGColor: true),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          children: [
            AppSpacing.height16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: AppBoxDecoration.greenGradientRounded(
                      radius: 16.r,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.r16,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          AddAddressTextField(
                            title: "Enter Amount or Select Any".tr,
                            hintText: "250 HTG",
                            borderLight: true,
                            backgroundTrans: true,
                            radius: 8.r,
                          ),
                          AppSpacing.height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AmountOptionTile(
                                text: "250 HTG",
                                isSelected: true,
                                onTap: () {},
                              ),
                              AppSpacing.width8,
                              AmountOptionTile(
                                text: "550 HTG",
                                isSelected: false,
                                onTap: () {},
                              ),
                              AppSpacing.width8,
                              AmountOptionTile(
                                text: "1000 HTG",
                                isSelected: false,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.height16,
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: AppBoxDecoration.greenGradientRounded(
                      radius: 16.r,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.r16,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "${"Note".tr}:".tr,
                            fontWeight: FontWeight.w600,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: ll.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: CircleAvatar(
                                        radius: 2,
                                        backgroundColor: Colors.black,
                                      ),
                                    ),
                                    AppSpacing.width8,
                                    Flexible(
                                      child: Text(
                                        ll[index],
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Save button at bottom (80px from bottom)
            AppButton(
              text1: "Proceed to Add Balance".tr,
              callback: () {
                Get.to(() => SelectCardToPayScreen());
                // if (edit) {
                //   Get.back();
                // }
              },
            ),
            AppSpacing.height70,
          ],
        ),
      ),
    );
  }
}

List<String> ll = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
];
