import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domin/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   bool isTermsAndConditionsChecked = false;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void doSignUp() async {
    emit(SignUpLoading());
    final result = await authRepo.register(
        nameController.text, emailController.text, passwordController.text);
    result.fold(
      (failure) => emit(SignUpError(failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity)),
    );
  }
}
