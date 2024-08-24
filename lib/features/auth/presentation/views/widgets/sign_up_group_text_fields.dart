import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../cubits/sign_up_cubit/signup_cubit.dart';

class SignUpGroupTextFormFields extends StatefulWidget {
  const SignUpGroupTextFormFields({super.key});

  @override
  State<SignUpGroupTextFormFields> createState() =>
      _SignUpGroupTextFormFieldsState();
}

class _SignUpGroupTextFormFieldsState extends State<SignUpGroupTextFormFields> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: context.read<SignUpCubit>().nameController,
              hintText: 'الاسم كامل'),
          const SizedBox(height: 16),
          CustomTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              hintText: 'البريد الإلكتروني'),
          const SizedBox(height: 16),
          CustomTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              hintText: 'كلمة المرور',
              obscureText: obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? const Icon(
                        Icons.visibility_off_rounded,
                        color: Color(0XFFC9CECF),
                      )
                    : const Icon(
                        Icons.visibility_rounded,
                        color: Color(0XFFC9CECF),
                      ),
              )),
        ],
      ),
    );
  }
}
