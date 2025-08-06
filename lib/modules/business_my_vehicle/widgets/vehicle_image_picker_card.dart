import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:annale_driver/core/values/app_fonts.dart';

class VehicleImagePickerCard extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onTap;
  final double cardSize;
  final double borderRadiusValue;

  const VehicleImagePickerCard({
    super.key,
    this.imagePath,
    this.onTap,
    this.cardSize = 80,
    this.borderRadiusValue = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(borderRadiusValue.r),
      ),

      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(borderRadiusValue.r),
          padding: EdgeInsets.all(4.r),
          dashPattern: const [6, 3],
          color: const Color(0xFF4CAF50),
          strokeWidth: 1.5.r,
          child: Container(
            padding: EdgeInsets.all(8.w),
            alignment: Alignment.center,
            width: cardSize.w,
            height: cardSize.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusValue.r),
            ),
            child: imagePath != null && imagePath!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadiusValue.r),
                    child: SizedBox.expand(
                      child: Image.asset(
                        imagePath!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildPlaceholderContent(context);
                        },
                      ),
                    ),
                  )
                : _buildPlaceholderContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppGradients.green,
          ),
          child: Icon(Icons.add, size: AppFonts.size32, color: Colors.white),
        ),
      ],
    );
  }
}
