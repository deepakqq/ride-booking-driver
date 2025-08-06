import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowRatingStar extends StatelessWidget {
  final bool showSmall;
  final String rating;
  const ShowRatingStar({Key? key, this.showSmall = false, required this.rating})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r20, // Rating badge rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // Rating badge shadow
            blurRadius: 5,
            offset: Offset(0, 3.r),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.orange,
            size: showSmall ? AppFonts.size12 : AppFonts.size18,
          ),
          AppSpacing.width4,
          AppText(
            text: rating,
            fontSize: showSmall ? AppFonts.size12 : AppFonts.size14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
