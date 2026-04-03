import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';

class FetchCategoresUseCase extends UseCase<List<CategoryEntite>, NoParams> {
  final HomeRepo homeRepo;
  FetchCategoresUseCase( {required this.homeRepo});

  @override
  Future<Either<Failure, List<CategoryEntite>>> call({
    required NoParams params,
  }) async {
    final result = await homeRepo.fetchCategores();
    return result.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
