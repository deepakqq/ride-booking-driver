import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;

  const AppText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp, // ✅ responsive font
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        letterSpacing: letterSpacing?.sp, // optional scaling
        height: height, // already responsive by flutter
      ),
    );
  }
}
