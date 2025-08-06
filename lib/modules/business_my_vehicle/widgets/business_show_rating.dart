import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessShowRating extends StatelessWidget {
  final bool showSmall;
  final String rating;
  const BusinessShowRating({
    Key? key,
    this.showSmall = false,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: "$rating",
          fontSize: showSmall ? 12 : 14,
          color: Colors.grey,
        ),
        AppSpacing.width4,
        Icon(Icons.star, color: Colors.amber, size: showSmall ? 12.sp : 14.sp),
      ],
    );
  }
}
