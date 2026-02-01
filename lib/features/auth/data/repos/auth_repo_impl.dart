import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_erorrs/api_exceptions.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _authRemoteData;

  AuthRepoImpl({required AuthRemoteDataSource authRemoteData})
    : _authRemoteData = authRemoteData;

  @override
  Future<Either<ApiExceptions, UserEntity>> fetchProfile() async {
    try {
      final user = await _authRemoteData.fetchProfile();

      return Right(user);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    } catch (e) {
      return Left(ApiExceptions(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ApiExceptions, UserEntity>> login({
    required LoginParams params,
  }) async {
    try {
      final user = await _authRemoteData.login(params: params);

      await PrefHelper.saveToken(token: user.token!);

      return Right(user);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    } catch (e) {
      return Left(ApiExceptions(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ApiExceptions, UserEntity>> register({
    required SignupParams params,
  }) async {
    try {
      final user = await _authRemoteData.register(params: params);
      if (user.token != null) {
        PrefHelper.saveToken(token: user.token!);
      }
      return Right(user);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    } catch (e) {
      return Left(ApiExceptions(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ApiExceptions, Unit>> logout() async {
    try {
      await _authRemoteData.logout();
    } on DioException catch (e) {
      await PrefHelper.clearToken();
      return Left(ApiExceptions.fromDioError(e));
    } catch (e) {
      return Left(ApiExceptions(errMessage: e.toString()));
    }
    await PrefHelper.clearToken();

    return const Right(unit);
  }

  @override
  Future<Either<ApiExceptions, UserEntity>> updateProfile({
    required UpdateProfileParams params,
  }) async {
    try {
      final user = await _authRemoteData.updateProfile(params: params);
      return Right(user);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    } catch (e) {
      return Left(ApiExceptions(errMessage: e.toString()));
    }
  }
}
