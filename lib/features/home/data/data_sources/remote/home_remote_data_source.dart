import 'package:hungry/features/home/data/models/category/category.dart';
import 'package:hungry/features/home/data/models/product/datum.dart';
import 'package:hungry/features/home/data/models/product/product.dart';

abstract class HomeRemoteDataSource {
  Future<Category> fetchCategores();
  Future<Datum> fetchProductByID({required String id});
  Future<Product> fetchProductsByCategory({required int categoryID});
  Future<void> toggleFavorites({required int productId});
}
