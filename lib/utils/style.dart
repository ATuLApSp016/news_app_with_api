import 'package:flutter/material.dart';
import 'package:news_app_with_api/utils/colors.dart';

class AppStyles {
  // This is a common styles
  static TextStyle mainSemiBold = TextStyle(
    color: AppColors.mainTextColor,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    fontSize: 14,
  );
  static TextStyle mainBold = TextStyle(
    color: AppColors.mainTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    fontSize: 16,
  );
  static TextStyle mainLight = TextStyle(
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.7,
    fontSize: 12,
  );
  static TextStyle mainReguler = TextStyle(
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.7,
    fontSize: 14,
  );
  static TextStyle bold = TextStyle(
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.7,
    fontSize: 22,
  );
}
