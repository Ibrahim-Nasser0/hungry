import 'package:dartz/dartz.dart';

import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/use_case.dart';

import 'package:hungry/features/home/domain/repos/home_repo.dart';

class ToggleFavoritesUseCase extends UseCase<void, int> {
  final HomeRepo homeRepo;
  ToggleFavoritesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, void>> call({required int params}) async {
    return await homeRepo.toggleFavorites(productId: params);
  }
}