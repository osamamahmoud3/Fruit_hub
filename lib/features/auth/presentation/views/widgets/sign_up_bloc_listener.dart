import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_snack_bar.dart';
import '../cubits/sign_up_cubit/signup_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpError ||
          current is SignUpSuccess ||
          current is SignUpLoading,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم التسجيل بنجاح'),
            ),
          );
        } else if (state is SignUpError) {
          Navigator.pop(context);
          customErrorSnackBar(context: context, message: state.message);
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
