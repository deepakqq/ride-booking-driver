import 'package:annale_driver/core/values/app_redius.dart';
import 'package:flutter/material.dart';

class SmallRideContainer extends StatelessWidget {
  final String texts;
  const SmallRideContainer({super.key, this.texts = 'use text'});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        height: 52,
        width: 172,
        decoration: BoxDecoration(
          borderRadius: AppRadius.r8,
          color: Color(0xffFFFFFFF),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: texts,
            hintStyle: TextStyle(color: Color(0xff323135)),
          ),
        ),
      ),
    );
  }
}
