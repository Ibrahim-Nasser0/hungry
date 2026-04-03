import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';

class FetchByCategoryUseCase extends UseCase<List<ProductEntite>, int> {
  final HomeRepo homeRepo;

  FetchByCategoryUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntite>>> call({
    required int params,
  }) async {
    final result = await homeRepo.fetchProductsByCategory(category: params);
    return result.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
