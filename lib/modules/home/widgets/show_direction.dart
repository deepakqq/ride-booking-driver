import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDirection extends StatelessWidget {
  final String icon;
  final String distance;
  final String instruction;
  final Color colorFirst;
  final Color colorSecond;
  const ShowDirection({
    Key? key,
    required this.distance,
    required this.icon,
    required this.instruction,
    required this.colorFirst,
    required this.colorSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,

      decoration: BoxDecoration(
        color: colorFirst,
        borderRadius: AppRadius.r8, // गोल किनारे
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4.r),
          ),
        ],
      ),
      child: Row(
        children: [
          // Up Arrow Icon
          Container(
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              color: colorSecond, // ऑरेंज बैकग्राउंड
              borderRadius: AppRadius.r8.copyWith(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: AppFonts.size28,
                ),
                AppText(
                  text: distance,
                  fontSize: AppFonts.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          AppSpacing.width16,
          // Guidance Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: instruction,
                  fontSize: AppFonts.size14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Distance Text
          AppSpacing.width16,
        ],
      ),
    );
  }
}
