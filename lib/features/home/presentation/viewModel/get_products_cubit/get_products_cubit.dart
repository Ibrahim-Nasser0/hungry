import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/home/domain/use_cases/fetch_by_category_use_case.dart';
import 'package:hungry/features/home/domain/use_cases/search_products_use_case.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final FetchByCategoryUseCase fetchByCategoryUseCase;
  final SearchProductsUseCase searchProductsUseCase;
  GetProductsCubit({required this.fetchByCategoryUseCase, required this.searchProductsUseCase})
    : super(GetProductsInitial());

  Future<void> getProducts({required int categoryID}) async {
    emit(GetProductsLoading());
    final result = await fetchByCategoryUseCase.call(params: categoryID);
    result.fold(
      (failure) => emit(GetProductsFailure(errorMessage: failure.errMessage)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }
 
  Future<void> searchProducts({required String query}) async {
    if (query.isEmpty) {
      getProducts(categoryID: 1); 
      return;
    }
    emit(GetProductsLoading());
    final result = await searchProductsUseCase.call(params: query);
    result.fold(
      (failure) => emit(GetProductsFailure(errorMessage: failure.errMessage)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }

}
