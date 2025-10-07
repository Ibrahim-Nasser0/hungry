import 'package:hungry/features/cart/data/cart_model.dart';

abstract class CartState {
  final List<CartModel> products;

  const CartState({required this.products});
}

// الحالة المبدئية
class CartInitial extends CartState {
  const CartInitial() : super(products: const []);
}

// عند تحديث محتويات السلة (إضافة/حذف/تعديل كمية)
class CartUpdated extends CartState {
  const CartUpdated({required super.products});
}

// حالة لحساب السعر الكلي (اختياري لو عايز تعملها State منفصلة)
class CartTotalCalculated extends CartState {
  final double totalPrice;

  const CartTotalCalculated({
    required super.products,
    required this.totalPrice,
  });
}
