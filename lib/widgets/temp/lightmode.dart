import 'package:flutter/material.dart';

class Lightmode extends StatelessWidget {
  final String text;
  final bool ismodechange;
  const Lightmode({
    super.key,
    this.text = 'change text',
    this.ismodechange = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 31,
        width: 98,
        decoration: BoxDecoration(
          color: ismodechange ? Colors.black : Color(0xffDBDBDB),
          borderRadius: BorderRadius.circular(15.5),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8, bottom: 4),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: ismodechange ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Center(
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(13.5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Traced Image.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
