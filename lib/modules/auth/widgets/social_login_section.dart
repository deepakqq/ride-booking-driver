import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/auth/widgets/app_social_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginSection extends StatelessWidget {
  final bool hPad;
  const SocialLoginSection({Key? key, this.hPad = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad ? 16.w : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppSocialBtn(text: "Google", imagePath: AppImages.iconSGoogle),
          SizedBox(width: 6.w),
          AppSocialBtn(text: "Facebook", imagePath: AppImages.iconSFacebook),
          SizedBox(width: 6.w),
          AppSocialBtn(text: "Apple", imagePath: AppImages.iconSApple),
        ],
      ),
    );
  }
}
