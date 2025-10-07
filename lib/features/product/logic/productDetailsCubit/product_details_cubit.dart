import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/product/logic/productDetailsCubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState(0));
  void changeSpicyLevel(double value) {
    emit(SpicyLevel(value));
  }

  bool isHot() {
    if (state.spicy < 3) {
      return true;
    } else {
      return false;
    }
  }
}
