import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.suffixIcon,
      required this.hintText,
      this.controller,
      this.obscureText});
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          isDense: true,
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
