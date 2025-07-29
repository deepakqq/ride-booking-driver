import 'dart:ui';

import 'package:annale_driver/modules/home/widgets/inner_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContainer extends StatelessWidget {
  // final double width;
  final double height;
  final Widget? child; // कंटेनर के अंदर कोई भी विजेट रखने के लिए
  final Color color; // कंटेनर का रंग

  const HomeContainer({
    super.key,

    required this.height,
    this.child,
    this.color = Colors.white, // डिफ़ॉल्ट रूप से सफेद
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TopNotchClipper(),
      child: Container(
        // width: width,
        height: height,
        color: color,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.08),
                  Colors.transparent,
                  Colors.black.withOpacity(0.08),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  color: Colors.transparent,
                  child: child,
                  padding: EdgeInsets.only(top: 36.h),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double w = size.width;
    final double h = size.height;

    final double notchWidth = 140.w;
    final double notchHeight = 25.h;
    final double cornerRadius = 25.r;
    final double notchRadius = 20.r;

    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    path.lineTo((w / 2) - (notchWidth / 2) - notchRadius, 0);

    path.quadraticBezierTo(
      (w / 2) - (notchWidth / 2),
      0,
      (w / 2) - (notchWidth / 2),
      notchRadius,
    );
    path.lineTo((w / 2) - (notchWidth / 2), notchHeight - notchRadius);
    path.quadraticBezierTo(
      (w / 2) - (notchWidth / 2),
      notchHeight,
      (w / 2) - (notchWidth / 2) + notchRadius,
      notchHeight,
    );

    path.lineTo((w / 2) + (notchWidth / 2) - notchRadius, notchHeight);

    path.quadraticBezierTo(
      (w / 2) + (notchWidth / 2),
      notchHeight,
      (w / 2) + (notchWidth / 2),
      notchHeight - notchRadius,
    );
    path.lineTo((w / 2) + (notchWidth / 2), notchRadius);
    path.quadraticBezierTo(
      (w / 2) + (notchWidth / 2),
      0,
      (w / 2) + (notchWidth / 2) + notchRadius,
      0,
    );

    path.lineTo(w - cornerRadius, 0);

    path.quadraticBezierTo(w, 0, w, cornerRadius);

    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
