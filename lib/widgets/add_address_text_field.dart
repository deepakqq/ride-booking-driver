// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddAddressTextField extends StatelessWidget {
//   final String title;
//   final String hintText;
//   final VoidCallback? onTap;
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged; // ✅ New
//   final bool showSuffixIcon;
//   final bool borderLight;
//   final bool backgroundTrans;
//   final double radius;
//   final int maxline;

//   const AddAddressTextField({
//     Key? key,
//     required this.title,
//     required this.hintText,
//     this.onTap,
//     this.controller,
//     this.onChanged, // ✅ New
//     this.showSuffixIcon = false,
//     this.radius = 14,
//     this.maxline = 1,
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
//               color: backgroundTrans
//                   ? Colors.transparent
//                   : const Color(0xFFF5F9FA),
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
//                       maxLines: maxline,
//                       controller: controller,
//                       readOnly: onTap != null,
//                       onChanged: onChanged, // ✅ Hook added
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
//                 if (showSuffixIcon)
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
  final ValueChanged<String>? onChanged;
  final bool showSuffixIcon;
  final bool borderLight;
  final bool backgroundTrans;
  final double radius;
  final int maxline;

  const AddAddressTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.onTap,
    this.controller,
    this.onChanged,
    this.showSuffixIcon = false,
    this.radius = 14,
    this.maxline = 1, // डिफ़ॉल्ट 1 है
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
            // यहाँ height को कंडीशनली सेट किया गया है
            height: maxline == 1
                ? 50.h
                : null, // यदि maxline 1 है तो 50.h, अन्यथा null
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: maxline == 1 ? 0 : 8.h,
            ), // पैडिंग भी कंडीशनली एडजस्ट की गई
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
              crossAxisAlignment: maxline == 1
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment
                        .start, // मल्टीलाइन होने पर स्टार्ट अलाइन करें
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: onTap != null,
                    child: TextFormField(
                      // minLines को भी maxline के बराबर करें ताकि सिंगल लाइन में भी मिनिमम 1 लाइन रहे
                      minLines:
                          maxline, // अब minLines हमेशा maxline के बराबर रहेगा
                      maxLines:
                          maxline, // TextField अपनी ऊंचाई को maxline तक बढ़ाएगा
                      controller: controller,
                      readOnly: onTap != null,
                      onChanged: onChanged,
                      textAlignVertical: maxline == 1
                          ? TextAlignVertical.center
                          : TextAlignVertical
                                .top, // सिंगल लाइन के लिए सेंटर, मल्टीलाइन के लिए टॉप
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
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
