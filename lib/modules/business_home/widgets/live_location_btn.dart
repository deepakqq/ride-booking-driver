import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveLocationBtn extends StatelessWidget {
  const LiveLocationBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.h,
      width: 135.w,
      decoration: BoxDecoration(
        gradient: AppGradients.green,
        borderRadius: AppRadius.r30,
      ),
      child: AppText(
        text: "Live Location",
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
