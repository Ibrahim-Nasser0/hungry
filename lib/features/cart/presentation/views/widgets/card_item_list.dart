import 'package:flutter/material.dart';
import 'package:hungry/features/cart/data/models/cart_model.dart';
import 'package:hungry/features/cart/presentation/views/widgets/cart_item_card.dart';
import 'package:hungry/features/checkout/presentation/views/checkout_view.dart';

import 'package:hungry/core/shared/widgets/gaps.dart';
import 'package:hungry/core/shared/widgets/total_price_section.dart';

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
            return TotalPriceSection(
              text: 'Checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return CheckoutView();
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
