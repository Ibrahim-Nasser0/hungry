import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/data/models/cart_model.dart';
import 'package:hungry/features/cart/presentation/viewModel/cartCubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartInitial());

  void increaseProduct(CartModel product) {
    final updatedProduct = product.copyWith(quantity: (product.quantity++));

    emit(IncreaseProduct(product: updatedProduct));
  }

  void decreaseProduct(CartModel product) {
    if ((product.quantity) > 1) {
      final updatedProduct = product.copyWith(quantity: product.quantity--);
      emit(DecreaseProduct(product: updatedProduct));
    } else {
      emit(const CartInitial());
    }
  }

  void removeProduct(CartModel product) {
    emit(const CartInitial());
  }
}
