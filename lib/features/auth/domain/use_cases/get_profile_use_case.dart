import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';

class FetchProfileUseCase extends UseCase<UserEntity, NoParams> {
  final AuthRepo authRepo;

  FetchProfileUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserEntity>> call({required NoParams params}) async {
    final result = await authRepo.fetchProfile();

    return result.fold((failure) => Left(failure), (user) => Right(user));
  }
}
