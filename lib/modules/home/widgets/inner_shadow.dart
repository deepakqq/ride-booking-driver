import 'package:flutter/material.dart';

class InnerShadow extends StatelessWidget {
  final Widget? child;
  const InnerShadow({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.center,
          radius: 0.9,
          colors: [Colors.black.withOpacity(0.05), Colors.transparent],
          stops: [0.8, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: Container(color: Colors.transparent, child: child),
    );
  }
}
