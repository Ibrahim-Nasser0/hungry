import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';

class ApiExceptions extends Failure {
  ApiExceptions({required super.errMessage, super.statusCode});

  factory ApiExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ApiExceptions(
          errMessage: "Connection Timeout with ApiServer",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.sendTimeout:
        return ApiExceptions(
          errMessage: "Send Timeout with ApiServer",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.receiveTimeout:
        return ApiExceptions(
          errMessage: "Receive Timeout with ApiServer",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.badCertificate:
        return ApiExceptions(
          errMessage: "Bad Certificate with ApiServer",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.badResponse:
        {
          return ApiExceptions(
            errMessage: dioError.toString(),
            statusCode: dioError.response!.statusCode,
          );
        }
      case DioErrorType.cancel:
        return ApiExceptions(
          errMessage: "Request to ApiServer was cancelled",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.connectionError:
        return ApiExceptions(
          errMessage: "Connection Error with ApiServer",
          statusCode: dioError.response!.statusCode,
        );
      case DioErrorType.unknown:
        {
          if (dioError.message!.contains('SocketException')) {
            return ApiExceptions(
              errMessage: "No Internet Connection",
              statusCode: dioError.response!.statusCode,
            );
          }
          return ApiExceptions(
            errMessage: "Unexpected error , Please try again!",
            statusCode: dioError.response!.statusCode,
          );
        }
      // ignore: unreachable_switch_default
      default:
        return ApiExceptions(
          errMessage: "Oops something went wrong",
          statusCode: dioError.response!.statusCode,
        );
    }
  }

  factory ApiExceptions.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ApiExceptions(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ApiExceptions(
        errMessage: "Your request not found, Please try later!",
      );
    } else if (statusCode == 500) {
      return ApiExceptions(
        errMessage: "Internal Server error, Please try later!",
      );
    } else {
      return ApiExceptions(
        errMessage:
            "Oops something went wrong, Please try later! Status Code : $statusCode",
      );
    }
  }
}
