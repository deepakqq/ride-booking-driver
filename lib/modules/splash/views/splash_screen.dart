import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/onboarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstContainerSize;
  late Animation<double> _secondContainerSize;
  late Animation<double> _firstContainerMoveToTop;
  late Animation<double> _secondContainerSlideUp;
  late Animation<double> _bounceAnimation;
  bool showAnimation = true;

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addStatusListener((status) {
            // Add this listener to detect when animation completes
            if (status == AnimationStatus.completed) {
              // Navigate to next screen after animation finishes
              Future.delayed(Duration(milliseconds: 0), () {
                Get.offAll(
                  () => OnboardingScreen(),
                  transition: Transition.fadeIn,

                  duration: Duration(milliseconds: 500),
                );
              });
            }
          });

    // First animation: Logo grows from 0 to 130
    _firstContainerSize = Tween<double>(begin: 0, end: 130.h).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );

    // Second animation: Text slides up from bottom
    _secondContainerSlideUp =
        Tween<double>(
          begin: screenHeight,
          end: screenHeight / 2 + 60.h,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
          ),
        );

    _secondContainerSize = Tween<double>(begin: 0, end: 150.h).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Third animation: Logo moves to top
    _firstContainerMoveToTop = Tween<double>(begin: 0, end: -screenHeight / 3)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 0.8, curve: Curves.easeInOutBack),
          ),
        );

    // Fixed bounce animation - using a simple elastic curve instead of TweenSequence
    _bounceAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1.0, curve: Curves.elasticOut),
      ),
    );

    Future.delayed(Duration(milliseconds: 3100), () {
      setState(() {
        showAnimation = false;
      });
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calculate bounce effect - dips down then returns up
          final bounceValue = _bounceAnimation.value;
          final bounceOffset = bounceValue > 10
              ? 20 -
                    bounceValue // Return up after dip
              : bounceValue; // Initial dip down

          final totalVerticalOffset =
              _firstContainerMoveToTop.value + bounceOffset;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Logo container
              Positioned(
                top: ((screenHeight / 2) - 80.h) + totalVerticalOffset,
                left: screenWidth / 2 - _firstContainerSize.value / 2,
                child: Container(
                  width: _firstContainerSize.value,
                  height: _firstContainerSize.value,
                  child: Image.asset(AppImages.logo),
                ),
              ),

              // Text container
              Positioned(
                top: _secondContainerSlideUp.value,
                left: screenWidth / 2 - _secondContainerSize.value / 2,
                child: Container(
                  width: _secondContainerSize.value,
                  child: Image.asset(AppImages.logoText),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
