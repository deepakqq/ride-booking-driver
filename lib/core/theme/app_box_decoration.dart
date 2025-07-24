import 'package:flutter/material.dart';

class AppBoxDecoration {
  static BoxDecoration greenGradientRounded({
    double radius = 16,
    bool showShadow = false,
  }) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF7BDA40), Color(0xFF2D6F3F)],
      ),
      boxShadow: showShadow
          ? [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(3, 3),
                color: Colors.black.withValues(alpha: 51), // ~0.2 opacity
              ),
            ]
          : null,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
