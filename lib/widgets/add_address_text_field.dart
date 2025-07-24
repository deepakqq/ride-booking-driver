// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddAddressTextField extends StatelessWidget {
//   final String title;
//   final String hintText;
//   final VoidCallback? onTap;
//   final TextEditingController? controller;
//   final bool showSuffixIcon;
//   final bool borderLight;
//   final bool backgroundTrans;
//   final double radius;

//   const AddAddressTextField({
//     Key? key,
//     required this.title,
//     required this.hintText,
//     this.onTap,
//     this.controller,
//     this.showSuffixIcon = false, // 👈 default: hidden
//     this.radius = 14,
//     this.borderLight = false,
//     this.backgroundTrans = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: 50.h,
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             decoration: BoxDecoration(
//               color: backgroundTrans ? Colors.transparent : Color(0xFFF5F9FA),
//               borderRadius: BorderRadius.circular(radius.r),
//               border: Border.all(
//                 color: !borderLight ? Colors.black : Colors.grey.shade400,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: AbsorbPointer(
//                     absorbing: onTap != null,
//                     child: TextFormField(
//                       controller: controller,
//                       readOnly: onTap != null,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: hintText,
//                         hintStyle: TextStyle(
//                           fontSize: 14.sp,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (showSuffixIcon) // 👈 Only show if true
//                   const Icon(
//                     Icons.arrow_forward_ios,
//                     size: 16,
//                     color: Colors.black,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged; // ✅ New
  final bool showSuffixIcon;
  final bool borderLight;
  final bool backgroundTrans;
  final double radius;

  const AddAddressTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.onTap,
    this.controller,
    this.onChanged, // ✅ New
    this.showSuffixIcon = false,
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
            fontWeight: FontWeight.w600,
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
              color: backgroundTrans
                  ? Colors.transparent
                  : const Color(0xFFF5F9FA),
              borderRadius: BorderRadius.circular(radius.r),
              border: Border.all(
                color: !borderLight ? Colors.black : Colors.grey.shade400,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: onTap != null,
                    child: TextFormField(
                      controller: controller,
                      readOnly: onTap != null,
                      onChanged: onChanged, // ✅ Hook added
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
                if (showSuffixIcon)
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
