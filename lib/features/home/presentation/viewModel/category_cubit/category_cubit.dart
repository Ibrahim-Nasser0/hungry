import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';
import 'package:hungry/features/home/domain/use_cases/fetch_categores_use_case.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final FetchCategoresUseCase useCase;
  CategoryCubit({required this.useCase}) : super(CategoryInitial());
  Future<void> fetchCategoriesList() async {
    emit(CategoryLodaing());

    final result = await useCase(params: const NoParams());
    result.fold(
      (failure) {
        emit(CategoryFailure(errMessage: failure.errMessage));
      },
      (categories) {
        emit(CategorySuccess(categories: categories));
      },
    );
  }
}
