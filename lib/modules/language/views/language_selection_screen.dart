import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/translations/language_controller.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/language/widgets/language_tile.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());

    final controller = Get.find<LanguageController>();
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(title: "Languages".tr, screenBGColor: true),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontalPad,
          vertical: 20,
        ),
        children: controller.languages
            .map((lang) => LanguageTile(language: lang))
            .toList(),
      ),
    );
  }
}
