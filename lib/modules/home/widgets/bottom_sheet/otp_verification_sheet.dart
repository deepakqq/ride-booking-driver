import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/core/values/app_fonts.dart';

class OtpVerificationBottomSheet extends StatefulWidget {
  const OtpVerificationBottomSheet({super.key});

  @override
  State<OtpVerificationBottomSheet> createState() =>
      _OtpVerificationBottomSheetState();
}

class _OtpVerificationBottomSheetState
    extends State<OtpVerificationBottomSheet> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: AppRadius.r8,
        border: Border.all(color: Colors.grey.shade300, width: 1.r),
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(
            fontSize: AppFonts.size32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < _otpControllers.length - 1) {
                _focusNodes[index + 1].requestFocus();
              } else {
                _focusNodes[index].unfocus();
              }
            } else {
              if (index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            }
          },
        ),
      ),
    );
  }

  String _getOtp() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r30.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: AppText(
                text: "Cancel Ride",
                fontSize: AppFonts.size14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          AppSpacing.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "OTP Verification",
                fontSize: AppFonts.size16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
                align: TextAlign.center,
              ),
            ],
          ),

          AppSpacing.height4,
          AppText(
            text:
                "A 4 digit OTP code has been sent to the user,\nEnter the code to start the ride.",
            fontSize: AppFonts.size12,
            color: AppColors.textDark,

            align: TextAlign.center,

            // maxLines: 2,
          ),
          AppSpacing.height24,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                child: _buildOtpField(index),
              ),
            ),
          ),
          AppSpacing.height24,
          GestureDetector(
            onTap: () {
              print("Resend Code clicked");
            },
            child: AppText(
              text: "Resend Code",
              fontSize: AppFonts.size12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          AppSpacing.height30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              text1: "Next",
              callback: () {
                String otp = _getOtp();
                print("Entered OTP: $otp");
                Navigator.of(context).pop();
              },
            ),
          ),
          AppSpacing.height16,
        ],
      ),
    );
  }
}

void showOtpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const OtpVerificationBottomSheet(),
      );
    },
  );
}
