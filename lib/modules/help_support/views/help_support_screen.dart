// lib/modules/help/views/help_support_screen.dart
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/help_support/views/chat_screen.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpSupportScreen extends StatelessWidget {
  HelpSupportScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> faqs = [
    {
      'q': 'Can I pay in cash?',
      'a': 'Yes. Cash is accepted for rides in some regions...',
    },
    {
      'q': 'How do I select the payment method for the ride I want to take?',
      'a':
          'On the payment screen you can choose card, cash or wallet before confirming.',
    },
    {
      'q': 'I’m having issues with registration',
      'a':
          'Please ensure you entered a valid phone number and internet connectivity.',
    },
    {
      'q': 'I forgot an item in the vehicle',
      'a':
          'Tap Help > Lost & Found inside the trip details to contact the driver.',
    },
    {
      'q': 'What should I do in case of emergency?',
      'a':
          'Tap the emergency button in app or dial local emergency services immediately.',
    },
    {
      'q': 'How do I request a ride?',
      'a':
          'Open the home screen, set your destination, then tap Confirm Pickup.',
    },
    {
      'q': 'Can I bring my pet?',
      'a':
          'Pets are allowed in AnnAle Pet‑Friendly rides. Choose that option while booking.',
    },
    {
      'q': 'What vehicles are allowed on AnnAle?',
      'a': 'Two‑wheelers, three‑wheelers and small cars less than 5 years old.',
    },
    {
      'q': 'I have a disability, can I use AnnAle?',
      'a':
          'Yes. We support accessible rides; contact support to arrange assistance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 🔸Your custom AppBar will be injected above
      appBar: AppNormalAppBar(title: "Help & Support".tr, screenBGColor: true),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ✨ Section: Contact
          _sectionHeader('Contact'.tr, Color(0xffF6F6F8)),
          _navTile(
            leadingPath: AppImages.iconHelp,
            title: 'Call AnnAle support'.tr,
            onTap: () => Get.toNamed('/support/call'),
          ),
          SizedBox(height: 1),
          _navTile(
            leadingPath: AppImages.iconChat,
            title: 'Live Chat with AnnAle support'.tr,
            onTap: () {
              Get.to(() => ChatScreen());
            },
          ),

          // ✨ Section: FAQ
          _sectionHeader('Frequently Asked Questions'.tr, Color(0xffffffff)),
          ...faqs
              .map((e) => _faqTile(question: e['q']!, answer: e['a']!))
              .toList(),
        ],
      ),
    );
  }

  // ───────────────────────────────────────── helpers ──────────

  Widget _sectionHeader(String text, Color color) => Container(
    width: double.infinity,
    color: color, // light grey
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    ),
  );

  Widget _navTile({
    required String leadingPath,
    required String title,
    required VoidCallback onTap,
    Color bgColor = AppColors.screenBG,
  }) => ListTile(
    tileColor: AppColors.screenBG,
    contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
    leading: Image.asset(leadingPath, height: 24.h, width: 24.w),
    title: Text(
      title,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    ),
    trailing: const Icon(Icons.chevron_right, color: Colors.black54),
    onTap: onTap,
  );

  Widget _faqTile({required String question, required String answer}) => Column(
    children: [
      ExpansionTile(
        collapsedBackgroundColor: AppColors.screenBG,
        backgroundColor: AppColors.screenBG,
        tilePadding: EdgeInsets.symmetric(horizontal: 24.w),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ).copyWith(bottom: 12.h),
        title: Text(
          question,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black54),
        children: [
          Text(
            answer,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
          ),
        ],
      ),
      Container(width: Get.width, height: 1, color: Colors.grey.shade300),
    ],
  );
}
