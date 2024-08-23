import 'package:flutter/material.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/styles.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بلفعل؟',
          style: AppTextStyles.font16SemiBold.copyWith(
            color: const Color(0XFF949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            ' تسجيل دخول ',
            style: AppTextStyles.font16SemiBold
                .copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
