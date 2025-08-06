import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContainer extends StatelessWidget {
  final double height;
  final Widget? child;
  final Color color;

  const HomeContainer({
    super.key,
    required this.height,
    this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TopNotchClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.white, Colors.white],
            stops: const [0.0, 0.04, 0.1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _NotchInnerShadowPainter(
                  notchHeight: 25.h,
                  notchWidth: 140.w,
                  cornerRadius: 25.r,
                  notchRadius: 20.r,
                  shadowColor: Colors.black.withOpacity(0.2),
                  shadowBlur: 5.0,
                  shadowOffset: const Offset(0, 3.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 36.h),
              child: child,
            ),
          ],
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

class _NotchInnerShadowPainter extends CustomPainter {
  final double notchWidth;
  final double notchHeight;
  final double cornerRadius;
  final double notchRadius;
  final Color shadowColor;
  final double shadowBlur;
  final Offset shadowOffset;

  _NotchInnerShadowPainter({
    required this.notchWidth,
    required this.notchHeight,
    required this.cornerRadius,
    required this.notchRadius,
    required this.shadowColor,
    required this.shadowBlur,
    required this.shadowOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path mainPath = Path();
    final Path notchPath = Path();

    final double w = size.width;
    final double h = size.height;

    mainPath.moveTo(0, cornerRadius);
    mainPath.quadraticBezierTo(0, 0, cornerRadius, 0);
    mainPath.lineTo(w - cornerRadius, 0);
    mainPath.quadraticBezierTo(w, 0, w, cornerRadius);
    mainPath.lineTo(w, h);
    mainPath.lineTo(0, h);
    mainPath.close();

    notchPath.moveTo((w / 2) - (notchWidth / 2) - notchRadius, 0);
    notchPath.quadraticBezierTo(
      (w / 2) - (notchWidth / 2),
      0,
      (w / 2) - (notchWidth / 2),
      notchRadius,
    );
    notchPath.lineTo((w / 2) - (notchWidth / 2), notchHeight - notchRadius);
    notchPath.quadraticBezierTo(
      (w / 2) - (notchWidth / 2),
      notchHeight,
      (w / 2) - (notchWidth / 2) + notchRadius,
      notchHeight,
    );
    notchPath.lineTo((w / 2) + (notchWidth / 2) - notchRadius, notchHeight);
    notchPath.quadraticBezierTo(
      (w / 2) + (notchWidth / 2),
      notchHeight,
      (w / 2) + (notchWidth / 2),
      notchHeight - notchRadius,
    );
    notchPath.lineTo((w / 2) + (notchWidth / 2), notchRadius);
    notchPath.quadraticBezierTo(
      (w / 2) + (notchWidth / 2),
      0,
      (w / 2) + (notchWidth / 2) + notchRadius,
      0,
    );

    final Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur);

    Path innerNotchShadowPath = Path();
    innerNotchShadowPath.moveTo(
      (w / 2) - (notchWidth / 2) + notchRadius,
      notchHeight,
    );
    innerNotchShadowPath.lineTo(
      (w / 2) + (notchWidth / 2) - notchRadius,
      notchHeight,
    );

    Path shadowClippingPath = Path();

    shadowClippingPath.addRect(
      Rect.fromLTWH(0, notchHeight, w, h - notchHeight),
    );

    Path actualShadowPath = Path();
    actualShadowPath.moveTo(
      (w / 2) - (notchWidth / 2) + notchRadius,
      notchHeight,
    );
    actualShadowPath.lineTo(
      (w / 2) + (notchWidth / 2) - notchRadius,
      notchHeight,
    );
    actualShadowPath.quadraticBezierTo(
      (w / 2) + (notchWidth / 2),
      notchHeight,
      (w / 2) + (notchWidth / 2),
      notchHeight + 5,
    );
    actualShadowPath.lineTo((w / 2) - (notchWidth / 2), notchHeight + 5);
    actualShadowPath.quadraticBezierTo(
      (w / 2) - (notchWidth / 2),
      notchHeight,
      (w / 2) - (notchWidth / 2) + notchRadius,
      notchHeight,
    );
    actualShadowPath.close();

    canvas.drawPath(actualShadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant _NotchInnerShadowPainter oldDelegate) {
    return false;
  }
}
