import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_erorrs/api_exceptions.dart';
import 'package:hungry/core/network/dio_clint.dart';

class ApiService {
  final DioClint dioClint;

  ApiService({required this.dioClint});

  Future<dynamic> get({required String endPoint}) async {
    try {
      final Response response = await dioClint.dio.get(endPoint);
      return response;
    } catch (e) {
      if (e is DioError) {
        throw ApiExceptions.fromDioError(e);
      } else {
        throw ApiExceptions(errMessage: e.toString());
      }
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await dioClint.dio.post(endPoint, data: data);
      return response;
    } catch (e) {
      if (e is DioError) {
        throw ApiExceptions.fromDioError(e);
      } else {
        throw ApiExceptions(errMessage: e.toString());
      }
    }
  }

  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await dioClint.dio.put(endPoint, data: data);
      return response;
    } catch (e) {
      if (e is DioError) {
        throw ApiExceptions.fromDioError(e);
      } else {
        throw ApiExceptions(errMessage: e.toString());
      }
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await dioClint.dio.delete(endPoint, data: data);
      return response;
    } catch (e) {
      if (e is DioError) {
        throw ApiExceptions.fromDioError(e);
      } else {
        throw ApiExceptions(errMessage: e.toString());
      }
    }
  }
}
