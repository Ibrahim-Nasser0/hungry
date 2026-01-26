import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/presentation/viewModel/cartCubit/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/views/widgets/card_item_list.dart';
import 'package:hungry/core/shared/widgets/custom_app_bar.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [GapH(75), CustomAppBar(), CartItemsList()]),
        ),
      ),
    );
  }
}
