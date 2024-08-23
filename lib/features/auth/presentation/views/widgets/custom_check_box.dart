import 'package:flutter/material.dart';

import '../../../../../core/styles/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final double checkMarkSize;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.checkMarkSize = 24.0, // Default size
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.transparent,
          border: !isChecked
              ? Border.all(color: const Color(0XFFDDDFDF), width: 1.5)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isChecked
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18, // Default icon size
                ),
              )
            : null,
      ),
    );
  }
}
