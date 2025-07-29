import 'package:annale_driver/core/values/app_redius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletTextfield extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool showSuffixIcon;
  final bool borderLight;
  final bool backgroundTrans;
  final double radius;

  const WalletTextfield({
    Key? key,
    required this.title,
    required this.hintText,
    this.onTap,
    this.controller,
    this.showSuffixIcon = false, // 👈 default: hidden
    this.radius = 14,
    this.borderLight = false,
    this.backgroundTrans = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: AppRadius.r10,
              color: Color(0xffE5E6E5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: onTap != null,
                    child: TextFormField(
                      controller: controller,
                      readOnly: onTap != null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                if (showSuffixIcon) // 👈 Only show if true
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
