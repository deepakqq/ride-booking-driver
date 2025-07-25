import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  final String hintText;
  const AccountTextField({super.key, this.hintText = 'use hint'});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 13),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(width: 1),
        ),
        alignment: Alignment.centerLeft,
        height: 52,
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xff323135)),
          ),
        ),
      ),
    );
  }
}
