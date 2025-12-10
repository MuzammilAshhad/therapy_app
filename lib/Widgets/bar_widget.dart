import 'package:flutter/material.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';

/// BAR WIDGET FOR SIMPLE GRAPH
class BarWidget extends StatelessWidget {
  final String label;
  final double height;

  const BarWidget({super.key, required this.label, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.primary,      // Theme color
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: AppTextStyles.smallText,  // Theme small text
        ),
      ],
    );
  }
}
