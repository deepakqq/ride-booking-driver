import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideActionBar extends StatelessWidget {
  final String price;
  final String buttonText;
  final VoidCallback onPressed;

  const RideActionBar({
    Key? key,
    required this.price,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Color(0xFF2F6F40), // dark green background
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: Color(0xFFE8B854), width: 1.5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price Text
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),

          // Track Button
          InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              height: 40.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7BDA40), Color(0xFF2D6F3F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
