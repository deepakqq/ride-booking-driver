import 'package:flutter/material.dart';
import 'app_colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.greyDark,
    primaryColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.greyDark,
    ),
  );
}
