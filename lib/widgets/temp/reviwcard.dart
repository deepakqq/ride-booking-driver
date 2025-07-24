import 'package:flutter/material.dart';

class Reviwcard extends StatelessWidget {
  final String bigText;
  final bool isColor;
  final bool isChangecolor;
  const Reviwcard({
    super.key,
    this.bigText = 'change text',
    this.isColor = false,
    this.isChangecolor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 26, top: 5),
        height: 33,
        width: 146,

        //  color: isChangecolor ? Color(0xff37598D) : null,
        decoration: isColor
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  colors: isChangecolor
                      ? [Color(0xffE7B84c), Color(0xffC99316)]
                      : [Color(0xff7ADA3F), Color(0xff2E6F40)],
                ),

                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                color: Color(0xff37598D),
                borderRadius: BorderRadius.circular(16),
              ),
        child: Text(
          bigText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
