import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyChallengeCard extends StatelessWidget {
  final int completedTrips;
  final int totalTrips;
  final String reward;
  final String title;

  const WeeklyChallengeCard({
    Key? key,
    required this.completedTrips,
    required this.totalTrips,
    required this.reward,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = (completedTrips / totalTrips).clamp(0.0, 1.0);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: 'Earn on Monday', fontSize: 10.sp),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Complete $totalTrips trips and\nget $reward extra',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            '$completedTrips trips done out of $totalTrips',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 8.h),
          // Progress bar with percentage
          Stack(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 8.h,
                    width: constraints.maxWidth * percentage,
                    decoration: BoxDecoration(
                      color: _getProgressColor(percentage),
                      borderRadius: BorderRadius.circular(4.r),
                      gradient: LinearGradient(
                        colors: [Color(0xFF4CAF50), Color(0xFF8BC34A)],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                bottom: 12.h,
                child: Text(
                  '${(percentage * 100).round()}%',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: _getProgressColor(percentage),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage < 0.3) return Color(0xFFF44336);
    if (percentage < 0.6) return Color(0xFFFFC107);
    return Color(0xFF4CAF50);
  }
}
