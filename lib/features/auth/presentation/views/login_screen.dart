import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/styles/styles.dart';
import 'package:fruits_hub/core/widgets/custom_botton.dart';
import 'package:fruits_hub/features/auth/presentation/views/cubits/login_cubit/login_cubit.dart';

import '../../../../core/styles/app_colors.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/dont_have_an_account_widget.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_group_text_fields.dart';
import 'widgets/or_divider.dart';
import 'widgets/social_authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar('تسجيل دخول', context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const LoginGroupTextFormFields(),
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
                  CustomBotton(
                      text: 'تسجيل دخول',
                      onPressed: () {
                        validateAndLogin(context);
                      }),
                  const SizedBox(
                    height: 33,
                  ),
                  const DontHaveAnAccountWidget(),
                  const LoginBlocListener(),
                  const SizedBox(
                    height: 37,
                  ),
                  const OrDivider(),
                  const SizedBox(
                    height: 16,
                  ),
                  const SocialAuthentication()
                ],
              ),
            ),
          ),
        ));
  }

  void validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().doLogin();
    }
  }
}
