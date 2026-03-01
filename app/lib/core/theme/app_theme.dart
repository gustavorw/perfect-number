import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0B95DA);
  static const Color background = Color(0xFF0A1921);
  static const Color surface = Color(0xFF14242E);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E9BA5);

  static const Color accent = Color(0xFF0B95DA);
  static const Color divider = Color(0xFF1F323D);
  static const Color error = Color(0xFFCF6679);
}

class AppTextStyle {
  static TextStyle unselectedLabelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle inputLabel = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle inputText = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle hintText = const TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
  );

  static TextStyle title = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static TextStyle titleCard = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static TextStyle subTitleCard = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}
