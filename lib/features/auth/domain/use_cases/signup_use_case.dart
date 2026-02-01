import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';

class SignupUseCase extends UseCase<UserEntity, SignupParams> {
  final AuthRepo authRepo;

  SignupUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call({
    required SignupParams params,
  }) async {
    final result = await authRepo.register(params: params);

    return result.fold((failure) => Left(failure), (user) async {
      if (user.token != null) {
        await PrefHelper.saveToken(token: user.token!);
      }
      return Right(user);
    });
  }
}
