import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';

class SearchProductsUseCase extends UseCase<List<ProductEntite>, String> {
  final HomeRepo homeRepo;
  SearchProductsUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<ProductEntite>>> call({
    required String params,
  }) async {
    return await homeRepo.fetchProductsBySearch(query: params);
  }
}
