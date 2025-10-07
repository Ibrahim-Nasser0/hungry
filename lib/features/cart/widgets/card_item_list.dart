import 'package:flutter/material.dart';
import 'package:hungry/features/cart/data/cart_model.dart';
import 'package:hungry/features/cart/widgets/cart_item_card.dart';

import 'package:hungry/features/shared/gaps.dart';
import 'package:hungry/features/shared/total_price_section.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  static final List<CartModel> products = [
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
    CartModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.length + 1,
        separatorBuilder: (context, index) => const GapH(10),
        itemBuilder: (context, index) {
          if (index < products.length) {
            return CartItemCard(product: products[index]);
          } else {
            return TotalPriceSection(text: 'Checkout', onTap: () {});
          }
        },
      ),
    );
  }
}
