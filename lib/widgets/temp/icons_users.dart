import 'package:flutter/material.dart';

class IconsUsers extends StatelessWidget {
  final String text;
  final String image;
  const IconsUsers({
    super.key,
    this.text = 'change text ',
    this.image = 'change image',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xffF5F9FA),

          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xff666666)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Center(
                child: Container(
                  height: 21.74,
                  width: 21.74,
                  padding: EdgeInsets.only(left: 15, top: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                  ),
                ),
              ),
              SizedBox(width: 14),
              Container(
                //  padding: EdgeInsets.only(top: 1),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
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
