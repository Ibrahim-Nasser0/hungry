import 'package:hungry/features/cart/data/models/cart_model.dart';

abstract class CartState {
  final CartModel? product; // منتج واحد بدل ليست

  const CartState({this.product});
}

class CartInitial extends CartState {
  const CartInitial() : super(product: null);
}

class CartUpdated extends CartState {
  const CartUpdated({required super.product});
}

class IncreaseProduct extends CartState {
  const IncreaseProduct({required super.product});
}

class DecreaseProduct extends CartState {
  const DecreaseProduct({required super.product});
}

class CartTotalCalculated extends CartState {
  final double totalPrice;

  const CartTotalCalculated({required super.product, required this.totalPrice});
}
