import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class SelectedCountryBox extends StatelessWidget {
  final String name;
  //final Widget child;
  final String images1;
  final String code;
  final VoidCallback? onTap;
  final bool isChange;
  SelectedCountryBox({
    super.key,
    this.images1 = 'choose img',
    this.code = '+1',
    this.name = 'select name',
    //required this.child,
    this.isChange = false,
    this.onTap,
  });

  //final CountryController countryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(images1, height: 18, width: 24),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(fontSize: 16, color: Color(0xff000000)),
              ),
              // SizedBox(width: 10),
              Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: Text(code, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
