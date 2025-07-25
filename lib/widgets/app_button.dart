import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text1;
  final bool whitebutton;
  final bool showBorder;
  final VoidCallback? callback;
  final Gradient? gradient; // ✅ Custom gradient
  final Color? color; // ✅ Solid color
  final double? height; // ✅ Dynamic height
  final double? width; // ✅ Dynamic width
  final double? fontSize; // ✅ Dynamic font size
  final double radius; // ✅ Dynamic font size

  const AppButton({
    Key? key,
    this.text1 = 'change text',
    this.whitebutton = false,
    this.showBorder = false,
    this.callback,
    this.gradient,
    this.color,
    this.height,
    this.width,
    this.fontSize,
    this.radius = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = whitebutton ? Color(0xff818181) : color;

    final backgroundGradient = whitebutton
        ? null
        : gradient ??
              LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff7ADA3F), Color(0xff2F6F40)],
              );

    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height ?? 53.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundGradient == null ? backgroundColor : null,
          gradient: backgroundGradient,
          border: Border.all(
            width: 1.w,
            color: whitebutton
                ? Colors.white
                : showBorder
                ? Color(0xff000000)
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: AppText(
          text: text1,
          fontSize: fontSize ?? 18.sp,
          color: whitebutton ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
