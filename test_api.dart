import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  try {
    print('Testing /products?category_id=1');
    final res1 = await dio.get('https://sonic-zdi0.onrender.com/api/products?category_id=1');
    print(res1.data);
    print('\nTesting /categories/1/products');
    final res2 = await dio.get('https://sonic-zdi0.onrender.com/api/categories/1/products');
    print(res2.data);
  } catch (e) {
    if (e is DioException) {
      print(e.response?.data);
    } else {
      print(e);
    }
  }
}
