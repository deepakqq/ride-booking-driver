import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnlineBtn extends StatelessWidget {
  const OnlineBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, // सेंटर अलाइनमेंट ऑनलाइन बटन के लिए
      child: Container(
        width: 130.w,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green, // हरे रंग का बटन
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // शैडो नीचे की ओर
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // कंटेंट के साइज़ तक श्रिंक करें
          children: const [
            Icon(
              Icons.directions_car, // या कोई और वाहन आइकन
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Online',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
