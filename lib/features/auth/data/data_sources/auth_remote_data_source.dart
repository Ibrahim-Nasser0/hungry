import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> fetchProfile();
  Future<UserEntity> login({required LoginParams params});
  Future<UserEntity> register({required SignupParams params});
  Future<void> logout();
  Future<UserEntity> updateProfile({required UpdateProfileParams params});
}
