import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/error_handler.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/features/auth/domin/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';

import '../../../../core/errors/custom_exception.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseServices;

  AuthRepoImpl({required this.firebaseServices});
  @override
  Future<Either<Failure, UserEntity>> register(
      String name, String email, String password) async {
    try {
      final user =
          await firebaseServices.signUpWithEmailAndPassword(email, password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final user =
          await firebaseServices.signInWithEmailAndPassword(email, password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await firebaseServices.signInWithGoogle();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook()async {
    try {
      final user = await firebaseServices.signInWithFacebook();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
   
  }
}
