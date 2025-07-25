import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/utils/printf.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ÷ 👈 Your login screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool showGetStarted = false;

  late AnimationController _buttonController;
  late Animation<double> _scaleAnimation;

  final onboardingData = [
    {
      'image': 'assets/images/onboarding/1.png',
      'title': 'Ride with Comfort',
      'description': 'Enjoy reliable and safe rides\nat your convenience.',
    },
    {
      'image': 'assets/images/onboarding/2.png',
      'title': 'Track your Ride',
      'description': 'Stay updated in real-time\nwith driver location.',
    },
    {
      'image': 'assets/images/onboarding/3.png',
      'title': 'Easy Payments',
      'description': 'Multiple payment options for\na hassle-free experience.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/obg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 🔝 Logo
              Padding(
                padding: EdgeInsets.only(top: 0.h),
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png", height: 55.h),
                    AppText(
                      text: "AnnAle",
                      height: 1.1,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ],
                ),
              ),

              // 🔄 Page View
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics:
                      const NeverScrollableScrollPhysics(), // ✅ disable swipe
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      showGetStarted = false;
                      _buttonController.reset();
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return TweenAnimationBuilder<Offset>(
                      key: ValueKey(index),
                      tween: Tween<Offset>(
                        begin: Offset(index > currentIndex ? 1.2 : -1.2, 0),
                        end: Offset.zero,
                      ),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.elasticOut,
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: Offset(offset.dx * 30, 0),
                          child: child,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item['image']!, width: Get.width - 42.w),
                          SizedBox(height: 16.h),
                          AppText(
                            text: item['title']!,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: AppText(
                              text: "Lorem Ipsum is simply dummy text",
                              align: TextAlign.center,
                              fontSize: 12.sp,
                              color: Colors.grey.shade800,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: AppText(
                              text: "printing and typesetting industry.Lorem",
                              align: TextAlign.center,
                              fontSize: 12.sp,
                              color: Colors.black,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: AppText(
                              text: "Ipsum ha been the",
                              fontSize: 12.sp,
                              color: Colors.grey.shade800,
                              height: 1.5,
                              align: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 🔘 Page Indicator + Skip + Arrow/Get Started
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardingData.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: const Color(0xFF1C6B44),
                        dotColor: const Color.fromARGB(255, 106, 216, 166),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // _pageController.jumpToPage(
                            // onboardingData.length - 1,
                            // );
                            gotoLogin();
                          },
                          child: AppText(
                            text: "Skip",
                            color: Color(0xff545454),
                            letterSpacing: 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _toggleWidth();
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            // key: const ValueKey("arrow"),
                            height: 55.h,
                            width: _containerWidth,
                            decoration: BoxDecoration(
                              color: Color(0xFF1C6B44),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(55.h),
                            ),
                            child: _expanded
                                ? AppText(
                                    text: "Get Started",
                                    color: Colors.white,

                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleWidth() {
    printf(currentIndex);
    if (currentIndex != 2) {
      gotoNextSlide();
    } else {
      if (_expanded == false) {
        _containerWidth = Get.width * .5 - 34;
        Future.delayed(Duration(milliseconds: 400), () {
          _expanded = true;
          setState(() {});
        });
      } else {
        gotoLogin();
      }
    }

    // printf(_expanded);
    setState(() {});
  }

  // methods
  gotoLogin() {
    Get.offNamed(AppRoutes.login);
  }

  gotoNextSlide() {
    if (currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.elasticOut,
      );
    }
  }

  double _containerWidth = 55.h; // Initial width
  bool _expanded = false;
}
