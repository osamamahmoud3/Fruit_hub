import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/styles/styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_botton.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

import '../../../../core/styles/app_colors.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/dont_have_an_account_widget.dart';
import 'widgets/or_divider.dart';
import 'widgets/social_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar('تسجيل دخول', context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const CustomTextFormField(
                  hintText: 'البريد الالكتروني',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormField(
                  hintText: 'كلمة المرور',
                  suffixIcon: Icon(
                    Icons.visibility_rounded,
                    color: Color(0XFFC9CECF),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.font13SemiBold
                          .copyWith(color: AppColors.lightPrimaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomBotton(text: 'تسجيل دخول', onPressed: () {}),
                const SizedBox(
                  height: 33,
                ),
                const DontHaveAnAccountWidget(),
                const SizedBox(
                  height: 37,
                ),
                const OrDivider(),
                const SizedBox(
                  height: 16,
                ),
                const SocialLoginButton(
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
                const SocialLoginButton(
                    image: Assets.imagesFacebookIcon,
                    title: 'تسجيل بواسطة فيسبوك'),
              ],
            ),
          ),
        ));
  }
}
