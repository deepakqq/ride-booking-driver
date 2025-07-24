// import 'package:flutter/material.dart';

// class AppSocialBtn extends StatelessWidget {
//   final String text;
//   final String imagePath;
//   final VoidCallback? onTap;
//   final double height;
//   final double borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final TextStyle? textStyle;

//   const AppSocialBtn({
//     Key? key,
//     required this.text,
//     required this.imagePath,
//     this.onTap,
//     this.height = 50,
//     this.borderRadius = 12,
//     this.backgroundColor = const Color(0xFFD9D9D9),
//     this.borderColor = const Color(0xFF2F2C53),
//     this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height,
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(borderRadius),
//           border: Border.all(color: borderColor!),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(imagePath, height: 24, width: 24),
//             const SizedBox(width: 8),
//             Text(
//               text,
//               style:
//                   textStyle ??
//                   const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSocialBtn extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  const AppSocialBtn({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.height = 45,
    this.borderRadius = 12,
    this.backgroundColor = const Color(0xFFD9D9D9),
    this.borderColor = const Color(0xFF2F2C53),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
          border: Border.all(color: borderColor!),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 24.h, width: 24.w),
            SizedBox(width: 4.w),
            Text(
              text,
              style:
                  textStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
