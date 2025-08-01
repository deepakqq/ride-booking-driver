// lib/modules/payment/widgets/card_item_widget.dart
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/app_text.dart';
import '../models/card_model.dart';

class BankAccountTile extends StatelessWidget {
  final BankModel card;
  final bool isSelected;
  final VoidCallback onTap;

  const BankAccountTile({
    Key? key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.borderLight, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(height: 16, width: 37, color: Colors.black),
                Image.asset(card.imagePath, height: 50.h),
                SizedBox(width: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: card.bankName, fontSize: 14.sp),
                    AppText(text: card.accountNumber, fontSize: 12.sp),
                  ],
                ),
                SizedBox(width: 8.h),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(AppImages.iconEditC, height: 24.h),
            ),
            // Radio<String>(
            //   value: card.id,
            //   groupValue: isSelected ? card.id : null,
            //   onChanged: (_) => onTap(),
            //   activeColor: Colors.black,
            //   fillColor: MaterialStateProperty.resolveWith(
            //     (states) => isSelected ? Colors.black : Colors.grey,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
