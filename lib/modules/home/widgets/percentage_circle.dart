import 'package:flutter/material.dart';

import 'dart:math' as math;

class PercentageCircle extends StatelessWidget {
  final double percentage; // 0.0 से 100.0 के बीच
  final double radius; // सर्कल का रेडियस
  final double strokeWidth; // सर्कल की मोटाई
  final Color backgroundColor; // अप्रोग्रेस भाग का रंग
  final Color progressColor; // प्रोग्रेस भाग का रंग
  final TextStyle? textStyle; // परसेंटेज टेक्स्ट का स्टाइल
  final double
  startAngleOffset; // आर्क के शुरुआती बिंदु को एडजस्ट करने के लिए (रेडियन में)
  final double
  totalArcSweepAngle; // कुल आर्क का कोण (रेडियन में, e.g., math.pi * 1.5 for 270 degrees)

  const PercentageCircle({
    super.key,
    required this.percentage,
    this.radius = 80.0,
    this.strokeWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.green,
    this.textStyle,
    // डिफ़ॉल्ट रूप से 270 डिग्री (3/4 सर्कल) के लिए सेट करें, जो नीचे से खुला है
    this.startAngleOffset =
        math.pi * 0.75, // यह कोण जहाँ से आर्क शुरू होगा (उदा. 135 डिग्री पर)
    this.totalArcSweepAngle = math.pi * 1.5, // कुल आर्क का फैलाव (270 डिग्री)
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

    // बैकग्राउंड आर्क के लिए पेंट
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // स्ट्रोक के लिए गोलाकार सिरे

    // प्रोग्रेस आर्क के लिए पेंट
    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // बैकग्राउंड आर्क ड्रा करें
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      startAngleOffset, // जहां से आर्क शुरू होता है
      totalArcSweepAngle, // आर्क का कुल फैलाव
      false, // सेंटर को शामिल न करें
      backgroundPaint,
    );

    // प्रोग्रेस आर्क ड्रा करें
    // कुल आर्क के भीतर परसेंटेज को मैप करें
    double progressSweepAngle = totalArcSweepAngle * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      startAngleOffset, // जहां से प्रोग्रेस आर्क शुरू होता है
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
