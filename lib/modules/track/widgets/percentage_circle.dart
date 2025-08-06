import 'package:flutter/material.dart';

import 'dart:math' as math;

class PercentageCircle extends StatelessWidget {
  final double percentage;
  final double radius;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle? textStyle;
  final double startAngleOffset;
  final double totalArcSweepAngle;

  const PercentageCircle({
    super.key,
    required this.percentage,
    this.radius = 80.0,
    this.strokeWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.green,
    this.textStyle,
    this.startAngleOffset = math.pi * 0.75,
    this.totalArcSweepAngle = math.pi * 1.5,
  });

  @override
  Widget build(BuildContext context) {
    final double safePercentage = percentage.clamp(0.0, 100.0);

    final TextStyle defaultTextStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: _CircularPartialPercentagePainter(
          percentage: safePercentage,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          strokeWidth: strokeWidth,
          startAngleOffset: startAngleOffset,
          totalArcSweepAngle: totalArcSweepAngle,
        ),
        child: Center(
          child: Text(
            '${safePercentage.toInt()}%',
            style: textStyle ?? defaultTextStyle,
          ),
        ),
      ),
    );
  }
}

class _CircularPartialPercentagePainter extends CustomPainter {
  final double percentage;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngleOffset;
  final double totalArcSweepAngle;

  _CircularPartialPercentagePainter({
    required this.percentage,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
    required this.startAngleOffset,
    required this.totalArcSweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double innerRadius = (size.width - strokeWidth) / 2;
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      startAngleOffset,
      totalArcSweepAngle,
      false,
      backgroundPaint,
    );
    double progressSweepAngle = totalArcSweepAngle * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      startAngleOffset,
      progressSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularPartialPercentagePainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startAngleOffset != startAngleOffset ||
        oldDelegate.totalArcSweepAngle != totalArcSweepAngle;
  }
}
