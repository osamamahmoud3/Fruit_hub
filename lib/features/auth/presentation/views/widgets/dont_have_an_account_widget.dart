import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/routes.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب؟',
          style: AppTextStyles.font16SemiBold.copyWith(
            color: const Color(0XFF949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signUp);
          },
          child: Text(
            'قم بانشاء حساب',
            style: AppTextStyles.font16SemiBold
                .copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
