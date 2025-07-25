import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/onboarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Increased total duration to 2500ms for slower animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Circle growing animation - now takes 60% of total time
    _circleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.6, curve: Curves.easeInOut),
      ),
    );

    // Logo fade-in animation - starts at 50% and ends at 70%
    _logoOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
      ),
    );

    // Slide up animation for both circle and logo - starts at 70%
    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1.5)).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
          ),
        );

    _controller.forward();

    // Navigate to next screen after animation completes
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     Future.delayed(const Duration(milliseconds: 0), () {
    //       Get.offNamed(AppRoutes.onboarding,);
    //     });
    //   }
    // });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 0), () {
          Get.off(
            () => const OnboardingScreen(),

            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 100),
          );
        });
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
    final screenSize = MediaQuery.of(context).size;
    // Reduced max circle size to make slide-up more visible
    final maxCircleSize = screenSize.height * 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Background circle that grows and covers the screen
              Positioned(
                left:
                    screenSize.width / 2 -
                    (_circleAnimation.value * maxCircleSize) / 2,
                top:
                    screenSize.height / 2 -
                    (_circleAnimation.value * maxCircleSize) / 2,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    width: _circleAnimation.value * maxCircleSize,
                    height: _circleAnimation.value * maxCircleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),

              // Slide up transition for logo
              SlideTransition(
                position: _slideAnimation,
                child: Center(
                  child: Opacity(
                    opacity: _logoOpacityAnimation.value,
                    child: Image.asset(
                      AppImages.logo,
                      color: Colors.white,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: Text('Welcome to the app!')),
    );
  }
}
