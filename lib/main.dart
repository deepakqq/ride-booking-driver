import 'package:annale_driver/core/controllers/theme_controller.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/translations/language_controller.dart';
import 'package:annale_driver/core/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final languageController = Get.put(LanguageController());
  languageController.setLocale('en', 'US');
  runApp(MyApp(languageController: languageController));
  Get.put(ThemeController());
}

class MyApp extends StatelessWidget {
  final LanguageController languageController;
  const MyApp({Key? key, required this.languageController}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // iPhone 11 Pro reference size (standard)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: languageController.selectedLocale.value,
          fallbackLocale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: 'Ann Ale Driver',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          themeMode: ThemeController.to.themeMode,
          // home: SplashScreen(),
          // home: SplashScreen(),
          initialRoute: AppRoutes.onboarding,
          getPages: AppPages.routes,
        );
      },
      // child: LoginScreen(), // or any initial screen
    );
  }
}
