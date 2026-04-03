import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProductEntite>> fetchProductByID({required String id});

  Future<Either<Failure, List<ProductEntite>>> fetchProductsByCategory({
    required int category,
  });
   Future<Either<Failure, List<ProductEntite>>> fetchProductsBySearch({
    required String query,
  });
  Future<Either<Failure, List<CategoryEntite>>> fetchCategores();
  Future<Either<Failure, void>> toggleFavorites({required int productId});
  
}
