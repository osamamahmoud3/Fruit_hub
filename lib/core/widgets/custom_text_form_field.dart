import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.suffixIcon, required this.hintText});
  final Widget? suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          fillColor: const Color(0XFFF9FAFA),
          filled: true,
          border: BorderStyle(),
          suffixIcon: suffixIcon,
          enabledBorder: BorderStyle(),
          focusedBorder: BorderStyle(),
          hintText: hintText,
          hintStyle: AppTextStyles.font13BoldCairo
              .copyWith(color: const Color(0XFF949D9E))),
    );
  }

  OutlineInputBorder BorderStyle() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(
        0XFFE6E9E9,
      )),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
