import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/data/cart_model.dart';
import 'package:hungry/features/cart/logic/cartCubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartInitial());

  void addProduct(CartModel product) {
    final updatedProducts = List<CartModel>.from(state.products);

    final index = updatedProducts.indexWhere((p) => p.title == product.title);

    if (index != -1) {
      // لو المنتج موجود نعدل الكمية
      updatedProducts[index].quantity = updatedProducts[index].quantity! + 1;
    } else {
      // لو مش موجود نضيفه
      updatedProducts.add(product);
    }

    emit(CartUpdated(products: updatedProducts));
  }
  

  void removeProduct(CartModel product) {
    final updatedProducts = List<CartModel>.from(state.products);

    final index = updatedProducts.indexWhere((p) => p.title == product.title);

    if (index != -1) {
      if (updatedProducts[index].quantity! > 1) {
        // لو الكمية أكبر من 1 هنقصها
        updatedProducts[index].quantity = updatedProducts[index].quantity! - 1;
      } else {
        // لو الكمية 1 هنشيله خالص
        updatedProducts.removeAt(index);
      }
    }

    emit(CartUpdated(products: updatedProducts));
  }
}
