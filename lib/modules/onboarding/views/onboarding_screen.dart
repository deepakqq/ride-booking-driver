// import 'package:annale_driver/core/theme/app_colors.dart';
// import 'package:annale_driver/widgets/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen>
//     with TickerProviderStateMixin {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;
//   bool showGetStarted = false;

//   final onboardingData = [
//     {
//       'image': 'assets/images/onboarding/1.png',
//       'title': 'Ride with Comfort',
//       'description': 'Enjoy reliable and safe rides\nat your convenience.',
//     },
//     {
//       'image': 'assets/images/onboarding/2.png',
//       'title': 'Track your Ride',
//       'description': 'Stay updated in real-time\nwith driver location.',
//     },
//     {
//       'image': 'assets/images/onboarding/3.png',
//       'title': 'Easy Payments',
//       'description': 'Multiple payment options for\na hassle-free experience.',
//     },
//   ];

//   void nextPage() {
//     if (currentIndex < onboardingData.length - 1) {
//       _pageController.nextPage(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     } else if (!showGetStarted) {
//       setState(() {
//         showGetStarted = true;
//       });
//     } else {
//       // Navigate to home/login screen
//       // Navigator.pushReplacement(...);
//     }
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/onboarding/obg1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Column(
//             children: [
//               // 🔝 Logo
//               Padding(
//                 padding: EdgeInsets.only(top: 0.0.h),
//                 child: Column(
//                   children: [
//                     Image.asset("assets/images/logo.png", height: 55.h),
//                     Text(
//                       "AnnAle",
//                       style: TextStyle(
//                         height: 1.1,
//                         fontSize: 28.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1C6B44),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // 🔁 PageView
//               Expanded(
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: onboardingData.length,
//                   physics:
//                       NeverScrollableScrollPhysics(), // disable manual swipe
//                   onPageChanged: (index) {
//                     setState(() {
//                       currentIndex = index;
//                       showGetStarted = false;
//                     });
//                   },
//                   itemBuilder: (context, index) {
//                     final item = onboardingData[index];
//                     return TweenAnimationBuilder<Offset>(
//                       key: ValueKey(index),
//                       tween: Tween<Offset>(
//                         begin: Offset(index > currentIndex ? 1.2 : -1.2, 0),
//                         end: Offset.zero,
//                       ),
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.elasticOut,
//                       builder: (context, offset, child) {
//                         return Transform.translate(
//                           offset: Offset(offset.dx * 30, 0),
//                           child: child,
//                         );
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(item['image']!, width: Get.width - 42.w),
//                           SizedBox(height: 24),
//                           Text(
//                             item['title']!,
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 12),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 32.0,
//                             ),
//                             child: Text(
//                               item['description']!,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.grey.shade800,
//                                 height: 1.5,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // 🔘 Page Indicator + Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24.0,
//                   vertical: 24,
//                 ),
//                 child: Column(
//                   children: [
//                     SmoothPageIndicator(
//                       controller: _pageController,
//                       count: onboardingData.length,
//                       effect: ExpandingDotsEffect(
//                         dotHeight: 8,
//                         dotWidth: 8,
//                         activeDotColor: Color(0xFF1C6B44),
//                         dotColor: const Color.fromARGB(255, 106, 216, 166),
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             _pageController.jumpToPage(
//                               onboardingData.length - 1,
//                             );
//                           },
//                           child: AppText(
//                             text: "Skip",
//                             color: Color(0xff545454),
//                             letterSpacing: 1,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: nextPage,
//                           child: AnimatedSwitcher(
//                             duration: Duration(milliseconds: 400),
//                             transitionBuilder: (child, animation) {
//                               return ScaleTransition(
//                                 scale: CurvedAnimation(
//                                   parent: animation,
//                                   curve: Curves.easeOutBack,
//                                 ),
//                                 child: FadeTransition(
//                                   opacity: animation,
//                                   child: child,
//                                 ),
//                               );
//                             },
//                             child: showGetStarted
//                                 ? Container(
//                                     key: ValueKey("getStarted"),
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 24.w,
//                                       vertical: 12.h,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primaryDark,
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     child: Text(
//                                       "Get Started",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16.sp,
//                                       ),
//                                     ),
//                                   )
//                                 : Container(
//                                     key: ValueKey("arrow"),
//                                     height: 55.h,
//                                     width: 55.h,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primaryDark,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Icon(
//                                       Icons.arrow_forward_ios_rounded,
//                                       color: Colors.white,
//                                       size: 20.sp,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/views/login_screen.dart';
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

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() => showGetStarted = true);
      _buttonController.forward();
    }
  }

  void onGetStartedPressed() {
    Get.offNamed(AppRoutes.login);
    // ✅ Navigate to login page
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (_) => const LoginScreen()),
    // );
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
                    Text(
                      "AnnAle",
                      style: TextStyle(
                        height: 1.1,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C6B44),
                      ),
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
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Text(
                              "Lorem Ipsum is simply dummy text",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey.shade800,
                                height: 1.5,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Text(
                              "printing and typesetting industry.Lorem",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Text(
                              "Ipsum ha been the",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey.shade800,
                                height: 1.5,
                              ),
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
                            _pageController.jumpToPage(
                              onboardingData.length - 1,
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Color(0xff545454),
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (showGetStarted) {
                              onGetStartedPressed();
                            } else {
                              nextPage();
                            }
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: showGetStarted
                                ? ScaleTransition(
                                    scale: _scaleAnimation,
                                    child: Container(
                                      key: const ValueKey("getStarted"),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1C6B44),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: AppText(
                                        text: "Get Started",
                                        color: Colors.white,

                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : Container(
                                    key: const ValueKey("arrow"),
                                    height: 55.h,
                                    width: 55.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1C6B44),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
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
}
