import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppSpacing {
  static double get xs => 4.w;
  static double get sm => 8.w;
  static double get md => 16.w;
  static double get lg => 22.w;
  static double get xl => 32.w;
  static double get pageHorizontalPad => 22.w;
  static EdgeInsets get containerPaddeing =>
      EdgeInsets.symmetric(vertical: sm, horizontal: md);

  static EdgeInsets get containerPaddeingSM =>
      EdgeInsets.symmetric(vertical: sm, horizontal: sm);
  static EdgeInsets get screenPadding =>
      EdgeInsets.symmetric(horizontal: lg, vertical: md);

  // Vertical gaps
  static SizedBox height4 = SizedBox(height: 4.h);
  static SizedBox height8 = SizedBox(height: 8.h);
  static SizedBox height12 = SizedBox(height: 12.h);
  static SizedBox height16 = SizedBox(height: 16.h);
  static SizedBox height24 = SizedBox(height: 24.h);
  static SizedBox height20 = SizedBox(height: 20.h);
  static SizedBox height14 = SizedBox(height: 14.h);
  static SizedBox height15 = SizedBox(height: 15.h);
  static SizedBox height30 = SizedBox(height: 30.h);
  static SizedBox height70 = SizedBox(height: 70.h);

  // Horizontal gaps
  static SizedBox width4 = SizedBox(width: 4.w);
  static SizedBox width8 = SizedBox(width: 8.w);
  static SizedBox width10 = SizedBox(width: 10.w);
  static SizedBox width16 = SizedBox(width: 16.w);
  static SizedBox width32 = SizedBox(width: 32.w);

  static EdgeInsets get paddingAllSM => EdgeInsets.all(sm);
  static EdgeInsets get paddingAllMD => EdgeInsets.all(md);
  static EdgeInsets get paddingAllLG => EdgeInsets.all(lg);

  static EdgeInsets get horizontalMD => EdgeInsets.symmetric(horizontal: md);
  static EdgeInsets get horizontalSM => EdgeInsets.symmetric(horizontal: sm);
  static EdgeInsets get horizontalLG => EdgeInsets.symmetric(horizontal: lg);
  static EdgeInsets get verticalMD => EdgeInsets.symmetric(vertical: md);
}
