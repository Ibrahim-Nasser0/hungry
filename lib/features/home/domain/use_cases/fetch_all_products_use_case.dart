import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';

class FetchAllProductsUseCase extends UseCase<List<ProductEntite>, NoParams> {
  final HomeRepo homeRepo;

  FetchAllProductsUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntite>>> call({
    required NoParams params,
  }) async {
    final result = await homeRepo.fetchProductsByCategory(category: 1);
    return result.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
