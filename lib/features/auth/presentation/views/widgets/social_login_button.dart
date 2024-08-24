import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.image,
    required this.title, this.onPressed,
  });
  final String image, title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 57,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color(
                0xfffdcdede,
              ),
              width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: onPressed,
        child: ListTile(
          title: Text(title,
              textAlign: TextAlign.center, style: AppTextStyles.font16SemiBold),
          leading: SvgPicture.asset(
            image,
          ),
        ));
  }
}
