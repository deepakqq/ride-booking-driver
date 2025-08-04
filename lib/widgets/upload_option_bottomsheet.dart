import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadOptionBottomSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onFileTap;

  const UploadOptionBottomSheet({
    super.key,
    required this.onCameraTap,
    required this.onFileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 24.w,
        right: 24.w,
        bottom: 30.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: AppText(
                    text: "Upload From",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3DAA3F),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: 24.sp),
              ),
            ],
          ),

          AppSpacing.height16,

          /// Camera & Files Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _UploadItem(
                imagePath:
                    'assets/images/camera-big.png', // Replace with your image
                label: 'Camera',
                onTap: onCameraTap,
              ),
              _UploadItem(
                imagePath:
                    'assets/images/file-big.png', // Replace with your image
                label: 'Files',
                onTap: onFileTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UploadItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const _UploadItem({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// Icon
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: AppRadius.r12,
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),

          AppSpacing.height4,

          /// Label
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF3DAA3F))),
            ),
            child: AppText(
              height: 1.1,
              text: label,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3DAA3F),
            ),
          ),
        ],
      ),
    );
  }
}
