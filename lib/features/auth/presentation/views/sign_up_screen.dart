import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/widgets/custom_botton.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

import 'widgets/already_have_an_account_widget.dart';
import 'widgets/custom_app_bar.dart';
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
              const CustomTextFormField(hintText: 'الاسم كامل'),
              const SizedBox(height: 16),
              const CustomTextFormField(hintText: 'البريد الإلكتروني'),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'كلمة المرور',
                suffixIcon: Icon(
                  Icons.visibility_rounded,
                  color: Color(0XFFC9CECF),
                ),
              ),
              const SizedBox(height: 33),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 30),
              CustomBotton(text: 'إنشاء حساب جديد', onPressed: () {}),
              const SizedBox(height: 26),
              const AlreadyHaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
