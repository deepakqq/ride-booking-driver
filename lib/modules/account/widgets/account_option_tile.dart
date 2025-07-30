import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountOptionTile extends StatelessWidget {
  final String title;
  final String leadingIconPath;
  final bool showSwitcher;
  final bool isDarkMode;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;

  const AccountOptionTile({
    super.key,
    required this.title,
    required this.leadingIconPath,
    this.showSwitcher = false,
    this.isDarkMode = false,
    this.onTap,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !showSwitcher ? onTap : null,
      child: Container(
        height: 55.h,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderBlack),
        ),
        child: Row(
          children: [
            // Leading Icon
            Image.asset(
              leadingIconPath,
              height: 24,
              width: 24,
              color: Colors.green,
            ),
            const SizedBox(width: 12),

            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            // Trailing: Arrow OR Switcher
            showSwitcher
                ? ModeSwitcher(isDarkMode: isDarkMode, onToggle: onToggle!)
                : Image.asset(
                    'assets/images/icons/icon-arrow-f.png',
                    height: 20,
                    width: 20,
                    color: Colors.green,
                  ),
          ],
        ),
      ),
    );
  }
}

class ModeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const ModeSwitcher({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        width: 140,
        height: 45,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Text (Light Mode / Dark Mode)
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isDarkMode
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Circle Icon that slides
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isDarkMode
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                height: 35,
                width: 35,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Image.asset(
                    isDarkMode ? AppImages.iconDark : AppImages.iconLight,
                    key: ValueKey(isDarkMode),
                    // color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
