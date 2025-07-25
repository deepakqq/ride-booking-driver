import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class DeleteAccountBtn extends StatelessWidget {
  const DeleteAccountBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffFF532D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Deactivate Account'.tr,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xffFFFFFF),
        ),
      ),
    );
  }
}
