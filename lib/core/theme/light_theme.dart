import 'package:flutter/material.dart';
import 'app_colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.greyLight,
    ),
  );
}
