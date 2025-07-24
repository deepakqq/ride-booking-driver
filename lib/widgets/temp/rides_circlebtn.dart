import 'package:flutter/material.dart';

class RidesCirclebtn extends StatelessWidget {
  final String bigText;
  final bool iscolor;
  const RidesCirclebtn({
    super.key,
    this.bigText = 'change text',
    this.iscolor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 151,
        height: 38,
        decoration: BoxDecoration(
          color: Color(0xff7BDA40),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 1),
                  alignment: Alignment.center,
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(50),
                    //shape: BoxShape.circle,
                  ),

                  child: Container(
                    alignment: Alignment.center,
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iscolor ? Color(0xffFF532D) : Color(0xff9C22FF),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: 94,
              height: 17,
              child: Text(
                bigText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
