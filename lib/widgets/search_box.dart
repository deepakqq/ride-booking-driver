import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const SearchBox({
    super.key,
    this.hintText = "Search Driver, Bike, etc",
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: AppColors.primary,
          borderRadius: AppRadius.r16,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5.r),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.black, size: 24.r),
            AppSpacing.width8,
            Expanded(
              child: AbsorbPointer(
                absorbing: onTap != null,
                child: TextField(
                  controller: controller,
                  readOnly: onTap != null,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: AppFonts.size16,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
