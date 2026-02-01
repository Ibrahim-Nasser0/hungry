import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_exceptions.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

abstract class AuthRepo {
  Future<Either<ApiExceptions, UserEntity>> login({
    required LoginParams params,
  });
  Future<Either<ApiExceptions, UserEntity>> register({
    required SignupParams params,
  });
  Future<Either<ApiExceptions, UserEntity>> fetchProfile();
  Future<Either<ApiExceptions, UserEntity>> updateProfile({
    required UpdateProfileParams params,
  });
  Future<Either<ApiExceptions, Unit>> logout();
}
