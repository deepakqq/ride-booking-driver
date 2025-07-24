import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingWidget extends StatelessWidget {
  final int selectedStars;
  final Function(int) onStarSelected;

  const StarRatingWidget({
    Key? key,
    required this.selectedStars,
    required this.onStarSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final isFilled = index < selectedStars;
        return GestureDetector(
          onTap: () => onStarSelected(index + 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              isFilled ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 30.sp,
            ),
          ),
        );
      }),
    );
  }
}
