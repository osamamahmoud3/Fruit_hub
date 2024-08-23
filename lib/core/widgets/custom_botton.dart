import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/app_colors.dart';

import '../styles/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 54,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.font16Bold.copyWith(color: Colors.white),
      ),
    );
  }
}
