import 'package:flutter/material.dart';

class Trackwidget extends StatelessWidget {
  final String bigText;
  final String mediumText;
  const Trackwidget({
    super.key,
    this.bigText = 'change big',
    this.mediumText = 'change medium',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(1),
        height: 43,
        width: 335,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [Color(0xffE7BB4C), Color(0xffC99316)],
          ),
        ),

        child: Container(
          // padding: EdgeInsets.all(1),
          height: 20,
          width: 250,
          decoration: BoxDecoration(
            color: Color(0xff2F6F40),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                height: 28,
                width: 102,
                padding: EdgeInsets.only(left: 18, top: 5, bottom: 6),
                child: Text(
                  bigText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              SizedBox(width: 130),
              Container(
                alignment: Alignment.center,
                height: 33,
                width: 91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [Color(0xff7ADA3F), Color(0xff2E6F40)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 21),
                  child: Text(
                    mediumText,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,

                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
