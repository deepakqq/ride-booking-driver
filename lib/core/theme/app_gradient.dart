import 'package:flutter/material.dart';

class AppGradients {
  // static const LinearGradient green = LinearGradient(
  //   colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
  //   begin: Alignment(-0.8, -0.6), // top-left से थोड़ा अंदर
  //   end: Alignment(0.8, 1.0), // bottom-right से थोड़ा कम
  // );
  static const LinearGradient green = LinearGradient(
    colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
    begin: Alignment.topCenter, // top-left से थोड़ा अंदर
    end: Alignment.bottomCenter,
  );
  static const LinearGradient greenLight = LinearGradient(
    colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
    begin: Alignment.topLeft, // top-left से थोड़ा अंदर
    end: Alignment.bottomRight,
  );
  static const LinearGradient green1 = LinearGradient(
    colors: [
      Color.fromARGB(255, 97, 169, 52),
      Color.fromARGB(255, 53, 130, 73),
    ],
    begin: Alignment.centerLeft, // top-left से थोड़ा अंदर
    end: Alignment.centerRight, // bottom-right से थोड़ा कम
  );
  static const LinearGradient green2 = LinearGradient(
    colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
    begin: Alignment(-0.8, -0.6), // top-left से थोड़ा अंदर
    end: Alignment(0.8, 1.0), // bottom-right से थोड़ा कम
  );
  static const LinearGradient yello = LinearGradient(
    colors: [Color(0xffE7B84C), Color(0xffC99316)],
    begin: Alignment(-0.8, -0.6), // top-left से थोड़ा अंदर
    end: Alignment(0.8, 1.0), // bottom-right से थोड़ा कम
  );
  static const LinearGradient black = LinearGradient(
    colors: [
      Color.fromARGB(255, 218, 218, 218),
      Color.fromARGB(255, 255, 255, 255),
    ],
    begin: Alignment.topLeft, // top-left से थोड़ा अंदर
    end: Alignment.bottomRight, // bottom-right से थोड़ा कम
  );
}
