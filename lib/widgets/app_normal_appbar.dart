import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class AppNormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBack;
  final VoidCallback? onBack;
  final bool screenBGColor;
  final showNotificationDeleteIcon;
  final VoidCallback? notificationDeleteCallback;

  const AppNormalAppBar({
    Key? key,
    required this.title,
    this.centerTitle = false,
    this.showBack = true,
    this.onBack,
    this.screenBGColor = false,
    this.showNotificationDeleteIcon = false,
    this.notificationDeleteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        showNotificationDeleteIcon
            ? Padding(
                padding: EdgeInsets.only(right: 22.w),
                child: GestureDetector(
                  onTap: notificationDeleteCallback,
                  child: Image.asset(AppImages.iconDelete, height: 24),
                ),
              )
            : SizedBox(),
      ],
      backgroundColor: screenBGColor ? AppColors.screenBG : Colors.white,
      elevation: 0,
      // automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: showBack
          ? IconButton(
              padding: EdgeInsets.all(0),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title.tr,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
