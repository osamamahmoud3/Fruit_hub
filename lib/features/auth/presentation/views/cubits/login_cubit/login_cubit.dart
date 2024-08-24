import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';

import '../../../../domin/entities/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void doLogin() async {
    emit(LoginLoading());
    final result =
        await authRepo.login(emailController.text, passwordController.text);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  void doLoginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  void doLoginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }
}
