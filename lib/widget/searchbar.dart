import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/utils/colors.dart';
import 'package:news_app_with_api/utils/style.dart';

Widget searchBar({
  required VoidCallback? onTap,
  required IconData? icon,
}) {
  return SizedBox(
    height: 40,
    child: TextField(
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(21),
        fillColor: AppColors.formColor,
        filled: false,
        hintText: 'Search',
        hintStyle: TextStyle(
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.7,
            fontSize: 15),
        suffixIcon: Icon(
         icon,
          color: AppColors.lightTextColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.lightTextColor),
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.lightTextColor),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.lightTextColor),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),
  );
}
