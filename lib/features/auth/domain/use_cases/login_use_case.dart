import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/core/use_cases/use_case.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call({
    required LoginParams params,
  }) async {
    final result = await authRepo.login(params: params);

    return result.fold((failure) => Left(failure), (user) async {
      if (user.token != null) {
        await PrefHelper.saveToken(token: user.token!);
      }
      return Right(user);
    });
  }
}
