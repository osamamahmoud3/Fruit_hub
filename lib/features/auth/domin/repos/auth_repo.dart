import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/error_handler.dart';
import 'package:fruits_hub/features/auth/domin/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register(
      String name, String email, String password);
  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, UserEntity>> loginWithFacebook();
}
