import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/network/api_erorrs/api_exceptions.dart';

import 'package:hungry/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:hungry/features/home/data/mappers/category_mapper.dart';
import 'package:hungry/features/home/data/mappers/product_mapper.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, ProductEntite>> fetchProductByID({
    required String id,
  }) async {
    try {
      final result = await remoteDataSource.fetchProductByID(id: id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntite>>> fetchCategores() async {
    try {
      final result = await remoteDataSource.fetchCategores();
      final categories = result.toEntity();
      return Right(categories);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntite>>> fetchProductsByCategory({
    required int category,
  }) async {
    try {
      final result = await remoteDataSource.fetchProductsByCategory(
        categoryID: category,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorites({required int productId}) async {
    try {
      final result = await remoteDataSource.toggleFavorites(productId: productId);
      return Right(result);
    } on DioException catch (e) {
      return Left(ApiExceptions.fromDioError(e));
    }
  }
}
