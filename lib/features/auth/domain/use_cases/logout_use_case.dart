import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';

class LogoutUseCase extends UseCase<Unit, NoParams> {
  final AuthRepo authRepo;

  LogoutUseCase({required this.authRepo});
  @override
  Future<Either<Failure, Unit>> call({required params}) async {
    final result = await authRepo.logout();

    return result.fold((failure) => Left(failure), (_) async {
      return const Right(unit);
    });
  }
}
