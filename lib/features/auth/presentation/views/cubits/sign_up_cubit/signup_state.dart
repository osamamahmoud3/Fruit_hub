part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;

  SignUpSuccess(this.userEntity);
}

class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}
