import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';

class CancelConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirmCancel;
  final VoidCallback onDismiss;

  const CancelConfirmationDialog({
    super.key,
    required this.onConfirmCancel,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.r16),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.height30,

          Icon(
            Icons.warning_rounded,
            color: const Color(0xFFFF5252),
            size: AppFonts.size40,
          ),
          AppSpacing.height16,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppText(
              text: "Do you want to cancel the ride?",
              fontSize: AppFonts.size20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              align: TextAlign.center,
            ),
          ),
          AppSpacing.height8,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppText(
              text: "You can't undo this action",
              fontSize: AppFonts.size12,
              color: Colors.black,
              align: TextAlign.center,
            ),
          ),
          AppSpacing.height30,

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.md,
                    right: AppSpacing.sm,
                  ),
                  child: OutlinedButton(
                    onPressed: onDismiss,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400, width: 1.r),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.r50,
                      ),
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    ),
                    child: AppText(
                      text: "No",
                      fontSize: AppFonts.size16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.sm,
                    right: AppSpacing.md,
                  ),
                  child: ElevatedButton(
                    onPressed: onConfirmCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5252),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.r50,
                      ),
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      elevation: 0,
                    ),
                    child: AppText(
                      text: "Yes, Cancel",
                      fontSize: AppFonts.size16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.height16,
        ],
      ),
    );
  }
}

void showCancelConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CancelConfirmationDialog(
        onConfirmCancel: () {
          print("Ride cancellation confirmed!");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onDismiss: () {
          print("Cancellation dismissed.");
          Navigator.of(context).pop();
        },
      );
    },
  );
}
