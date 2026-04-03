import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_endpoints.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:hungry/features/home/data/models/category/category.dart';
import 'package:hungry/features/home/data/models/product/datum.dart';
import 'package:hungry/features/home/data/models/product/product.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Category> fetchCategores() async {
    final Response result = await apiService.get(
      endPoint: ApiEndpoints.getAllCategory,
    );
    Category categories = Category.fromJson(result.data);

    return categories;
  }

  @override
  Future<Product> fetchProductsByCategory({required int categoryID}) async {
    final Response result = await apiService.get(
      endPoint: "${ApiEndpoints.getProductByCategory}?category_id=$categoryID",
      
    );
    Product product = Product.fromJson(result.data);
    return product;
  }

  @override
  Future<Datum> fetchProductByID({required String id}) async {
    final Response response = await apiService.get(
      endPoint: ApiEndpoints.getProductByID,
      data: {
        'id': id,
      },
    );

    return Datum.fromJson(response.data['data']);
  }
}
