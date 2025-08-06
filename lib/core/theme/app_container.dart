import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainerStyle {
  static BoxDecoration bottomNavigationContainer = BoxDecoration(
    borderRadius: BorderRadius.circular(22.r),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: Offset(2, 2),
        spreadRadius: 5,
        blurRadius: 6,
        color: const Color.fromARGB(255, 214, 214, 214),
      ),
    ],
  );
}
