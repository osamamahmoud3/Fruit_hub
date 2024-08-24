import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginGroupTextFormFields extends StatefulWidget {
  const LoginGroupTextFormFields({super.key});

  @override
  State<LoginGroupTextFormFields> createState() =>
      _LoginGroupTextFormFieldsState();
}

class _LoginGroupTextFormFieldsState extends State<LoginGroupTextFormFields> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: context.read<LoginCubit>().emailController,
          hintText: 'البريد الالكتروني',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
    );
  }
}
