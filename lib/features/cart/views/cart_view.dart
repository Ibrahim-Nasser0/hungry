import 'package:flutter/material.dart';
import 'package:hungry/features/cart/widgets/card_item_list.dart';
import 'package:hungry/features/shared/custom_app_bar.dart';
import 'package:hungry/features/shared/gaps.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [GapH(75), CustomAppBar(), CartItemsList()]),
      ),
    );
  }
}
