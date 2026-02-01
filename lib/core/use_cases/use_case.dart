import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}
