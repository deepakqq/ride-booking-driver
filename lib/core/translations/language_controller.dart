import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  Rx<Locale> selectedLocale = const Locale('en', 'US').obs;
  late SharedPreferences prefs;

  final List<LanguageModel> languages = [
    LanguageModel(name: 'English', code: 'en', countryCode: 'US'),
    LanguageModel(name: 'Haitian Creole', code: 'ht', countryCode: 'HT'),
    LanguageModel(name: 'French', code: 'fr', countryCode: 'FR'),
    LanguageModel(name: 'Spanish', code: 'es', countryCode: 'ES'),
  ];

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    String langCode = prefs.getString('lang_code') ?? 'ht'; // default 'ht'
    String countryCode =
        prefs.getString('country_code') ?? 'HT'; // default 'HT'
    selectedLocale.value = Locale(langCode, countryCode);
    Get.updateLocale(selectedLocale.value);
    super.onInit();
  }

  Future<void> selectLanguage(LanguageModel language) async {
    selectedLocale.value = language.locale;
    await prefs.setString('lang_code', language.code);
    await prefs.setString('country_code', language.countryCode);
    Get.updateLocale(language.locale);
  }

  bool isSelected(LanguageModel language) {
    return selectedLocale.value.languageCode == language.code;
  }

  void setLocale(String languageCode, String countryCode) {
    final locale = Locale(languageCode, countryCode);
    selectedLocale.value = locale;
    Get.updateLocale(locale);
  }
}

class LanguageModel {
  final String name;
  final String code;
  final String countryCode;

  LanguageModel({
    required this.name,
    required this.code,
    required this.countryCode,
  });

  Locale get locale => Locale(code, countryCode);
}
