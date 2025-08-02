import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/dialog/payment_dialog.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class PaymentOptionsSheet extends StatefulWidget {
  final VoidCallback? onQrTap;
  final VoidCallback? onCardTap;
  final VoidCallback? onCashTap;

  const PaymentOptionsSheet({
    super.key,
    this.onQrTap,
    this.onCardTap,
    this.onCashTap,
  });

  @override
  State<PaymentOptionsSheet> createState() => _PaymentOptionsSheetState();
}

class _PaymentOptionsSheetState extends State<PaymentOptionsSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          AppSpacing.height20,

          // Header: Close icon and Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, color: Colors.black, size: 24.r),
                ),
                AppText(
                  text: "Receive Payment",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                // Spacer to balance the layout
                SizedBox(width: 24.r),
              ],
            ),
          ),
          AppSpacing.height8,

          // Description Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppText(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              fontSize: 13.sp,
              color: AppColors.textDark,
              align: TextAlign.center,
            ),
          ),
          AppSpacing.height20,

          Divider(color: AppColors.divider, height: 1),

          AppSpacing.height20,

          // Payment Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              children: [
                _buildPaymentButton(
                  'QR',
                  AppImages.iconQr,
                  Color(0xffE7B84C),
                  widget.onQrTap,
                ),
                AppSpacing.height16,
                _buildPaymentButton(
                  'Card',
                  AppImages.iconCard,
                  AppColors.primaryDark,
                  widget.onCardTap,
                ),
                AppSpacing.height16,
                _buildPaymentButton(
                  'Cash',
                  AppImages.iconCash,
                  Color(0xff37598D),
                  widget.onCashTap,
                ),
              ],
            ),
          ),
          AppSpacing.height30,
        ],
      ),
    );
  }

  Widget _buildPaymentButton(
    String text,
    String icon,
    Color color,
    VoidCallback? onTap,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.r12),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 24.h),
            AppSpacing.width10,
            AppText(
              text: text,
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

void showPaymentOptionsSheet() {
  Get.bottomSheet(
    PaymentOptionsSheet(
      onQrTap: () {
        print("QR Button tapped!");
        Get.dialog(
          QRPaymentDialog(
            title: "Show QR to accept \nPayment",
            cardReaderImagePath: AppImages.QR,
            onDone: onDone,
          ),
        );
      },
      onCardTap: () {
        print("Card Button tapped!");
        Get.dialog(
          CardPaymentDialog(
            amount: "450 HTG",
            btnText: "Done",
            lottieAssetPath: AppImages.cardSwip,
            onDone: onDone,
            title: "Please Accept Payment\nThrough Card",
          ),
        );
      },
      onCashTap: () {
        print("Cash Button tapped!");
        Get.dialog(
          CashPaymentDialog(
            amount: "450 HTG",
            title: "Collect Cash",
            lottieAssetPath: AppImages.cardMoney,
            onDone: onDone,
          ),
        );
      },
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

onDone() {
  RideController rideController = Get.find();
  rideController.rideStatus.value = RideStatus.idle;
  Get.back();
  Get.back();
  Get.back();
  Get.to(() => ReviewScreen());
}
