import 'package:annale_driver/widgets/temp/rides_circlebtn.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RidesCard extends StatelessWidget {
  final String mediumText;
  final String bigText;
  final bool isChange;
  final String imagePath;
  final String whitetext;
  //final double width;
  //final double height;
  final double angleX;
  final double angleY;

  const RidesCard({
    super.key,
    this.mediumText = "change medium",
    this.bigText = "change big",
    this.isChange = false,
    this.imagePath = 'change image',
    this.whitetext = "change white",

    this.angleX = 0,
    this.angleY = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(1),
        height: 190,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          color: Color(0xff389458),
        ),
        child: Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xff24422C),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            children: [
              Positioned(
                width: 151,
                height: 20,
                top: 8,
                left: 13,

                child: Text(
                  mediumText,
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                width: 91,
                height: 20,
                top: 32,
                left: 13,

                child: Text(
                  mediumText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff7ADA3F),
                  ),
                ),
              ),
              Positioned(
                // width: 84,
                // height: 79,
                top: 1,
                left: 223,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(30 * pi / 180)
                    ..rotateX(10 * pi / 180),
                  child: Container(
                    width: 84,
                    height: 79,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 290,
                child: Container(
                  width: 49,
                  height: 49,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(49),

                    color: Color(0xff37598D),

                    image: DecorationImage(image: AssetImage(imagePath)),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 13,

                child: Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    right: 10,
                    bottom: 16,
                    left: 10,
                  ),
                  width: 151,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    color: Color(0xff7BDA40),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 13,
                child: RidesCirclebtn(
                  bigText: 'SBI BANK, Baner',
                  iscolor: true,
                ),
              ),
              Positioned(
                top: 90,
                left: 163,

                child: Container(
                  width: 18,
                  height: 18,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Frame.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 180,
                child: RidesCirclebtn(bigText: 'Central Park'),
              ),
              Positioned(
                width: 83,
                height: 20,
                top: 55,
                left: 13,

                child: Text(
                  whitetext,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isChange ? Color(0xffFFFFFF) : Colors.transparent,
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
