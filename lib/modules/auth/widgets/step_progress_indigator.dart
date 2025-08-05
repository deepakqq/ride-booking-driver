// file: step_progress_indicator.dart
import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep; // वर्तमान में पूरे हुए स्टेप्स (0, 1, 2, or 3)
  final int totalSteps;

  const StepProgressIndicator({
    Key? key,
    required this.currentStep,
    this.totalSteps = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 4.0,
            decoration: BoxDecoration(
              color: index < currentStep ? Colors.green : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
