import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/presentation/views/cubits/login_cubit/login_cubit.dart';

import '../../../../../core/utils/assets.dart';
import 'social_login_button.dart';

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          onPressed: () {
            context.read<LoginCubit>().doLoginWithGoogle();
          },
          image: Assets.imagesGoogleIcon,
          title: 'تسجيل بواسطة جوجل',
        ),
        const SizedBox(
          height: 16,
        ),
        const SocialLoginButton(
          image: Assets.imagesAppleIcon,
          title: 'تسجيل بواسطة أبل',
        ),
        const SizedBox(
          height: 16,
        ),
        SocialLoginButton(
            onPressed: () {
              context.read<LoginCubit>().doLoginWithFacebook();
            },
            image: Assets.imagesFacebookIcon,
            title: 'تسجيل بواسطة فيسبوك'),
      ],
    );
  }
}
