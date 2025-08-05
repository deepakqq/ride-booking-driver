import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppTextfield extends StatefulWidget {
  final String hintText;
  final String? prefixImagePath;
  final String? suffixImagePath;
  final TextEditingController? controller;
  final bool isPassword;
  final maxLine;

  const AppTextfield({
    Key? key,
    this.controller,
    this.hintText = 'Use hintText',
    this.prefixImagePath,
    this.suffixImagePath,
    this.isPassword = false,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.maxLine == 1 ? 55.h : null,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: const Color(0xffDFDFDF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.prefixImagePath != null
              ? Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Image.asset(
                    widget.prefixImagePath!,
                    height: 20.h,
                    width: 20.w,
                  ),
                )
              : SizedBox(),
          Expanded(
            child: TextFormField(
              maxLines: widget.maxLine,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscureText : false,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
              decoration: InputDecoration(
                // prefixIcon: widget.prefixImagePath != null
                //     ? Padding(
                //         padding: EdgeInsets.all(12.w),
                //         child: Image.asset(
                //           widget.prefixImagePath!,
                //           height: 20.h,
                //           width: 20.w,
                //         ),
                //       )
                // : null,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Image.asset(
                            _obscureText
                                ? AppImages
                                      .iconEye // you can use different icon if needed
                                : AppImages.iconEye,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      )
                    : widget.suffixImagePath != null
                    ? Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Image.asset(
                          widget.suffixImagePath!,
                          height: 20.h,
                          width: 20.w,
                        ),
                      )
                    : null,

                hintText: widget.hintText.tr,
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 134, 134, 134),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
