import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'toggle_category_state.dart';

class ToggleCategoryCubit extends Cubit<ToggleCategoryState> {
  ToggleCategoryCubit() : super(const ToggleCategoryState(0));

  void selectCategory(int index) => emit(ToggleCategoryState(index));
}
