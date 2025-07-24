import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSingupText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback? callback;
  const LoginSingupText({
    Key? key,
    this.firstText = "change this",
    this.secondText = "change this",
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(text: firstText, fontSize: 14.sp, color: Colors.black),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: callback,
          child: AppText(
            text: secondText,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff7990B7),
          ),
        ),
      ],
    );
  }
}
