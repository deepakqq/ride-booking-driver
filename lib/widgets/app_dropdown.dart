import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdown<T> extends StatelessWidget {
  final String title;
  final String hintText;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String Function(T) getLabel;
  final bool borderLight;
  final bool backgroundTrans;
  final double radius;

  const AppDropdown({
    Key? key,
    required this.title,
    required this.hintText,
    required this.items,
    required this.getLabel,
    this.value,
    this.onChanged,
    this.radius = 14,
    this.borderLight = false,
    this.backgroundTrans = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: backgroundTrans
                ? Colors.transparent
                : const Color(0xFFF5F9FA),
            borderRadius: BorderRadius.circular(radius.r),
            border: Border.all(
              color: !borderLight ? Colors.black : Colors.grey.shade400,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: Text(
                hintText,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
              isExpanded: true,
              onChanged: onChanged,
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    getLabel(item),
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
