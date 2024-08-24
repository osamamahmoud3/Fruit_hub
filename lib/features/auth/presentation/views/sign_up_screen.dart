import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_botton.dart';
import 'package:fruits_hub/core/widgets/custom_error_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/cubits/sign_up_cubit/signup_cubit.dart';

import 'widgets/already_have_an_account_widget.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/sign_up_group_text_fields.dart';
import 'widgets/terms_and_conditions_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('حساب جديد', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const SignUpGroupTextFormFields(),
              const SizedBox(height: 33),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 30),
              CustomBotton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    validateAndSignUp(context);
                  }),
              const SizedBox(height: 26),
              const AlreadyHaveAnAccountWidget(),
              const SignUpBlocListener()
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      if (context.read<SignUpCubit>().isTermsAndConditionsChecked == true) {
        context.read<SignUpCubit>().doSignUp();
      } else {
        customErrorSnackBar(
            message: 'يجب عليك الموافقة على الشروط والإحكام', context: context);
      }
    }
  }
}
