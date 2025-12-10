import 'package:flutter/material.dart';
import '../core/Theme/app_colors.dart';
import '../core/Theme/app_text_styles.dart';

class PatientCardWidget extends StatelessWidget {
  final String name;
  final String img;

  const PatientCardWidget(this.name, this.img, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          // GRADIENT using theme colors
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.secondary.withOpacity(0.3),
              AppColors.secondary.withOpacity(0.6),
            ],
            stops: const [0.3, 0.7, 1.0],
          ),
        ),

        child: Text(
          name,
          style: AppTextStyles.bodyBold.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
