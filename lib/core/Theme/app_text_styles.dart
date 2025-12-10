import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Main heading (Dashboard title etc.)
  static const heading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // Titles like "Users", "Patients"
  static const titleBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  // Simple body
  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const bodyBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  // Tiny grey text (like "Total Patients")
  static const smallText = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );
}
