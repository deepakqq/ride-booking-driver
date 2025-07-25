import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoTile extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String imagePath;
  final VoidCallback? onEdit;

  const ProfileInfoTile({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.imagePath,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.containerPaddeingSM,
      decoration: BoxDecoration(
        gradient: AppGradients.green,
        borderRadius: AppRadius.r10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Profile Image
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 60.r,
              height: 60.r,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),

          // Info Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Text(
                  email,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // Edit Icon
          GestureDetector(
            onTap: onEdit,
            child: Image.asset(AppImages.iconEdit, height: 25.h),
          ),
          // IconButton(
          //   icon: const Icon(Icons.edit_note_outlined, color: Colors.white),
          //   onPressed: onEdit,
          // ),
        ],
      ),
    );
  }
}
