import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/data/product_model.dart';
import 'package:hungry/features/product/logic/productDetailsCubit/product_details_cubit.dart';
import 'package:hungry/features/product/widgets/side_options_section.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';
import 'package:hungry/features/product/widgets/toppings_section.dart';
import 'package:hungry/features/shared/gaps.dart';
import 'package:hungry/features/shared/total_price_section.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SpicySlider(),
                const GapH(30),
                const ToppingsSection(),
                const GapH(30),
                const SideOptionsSection(),
                const Spacer(),
                TotalPriceSection(text: 'Add To Cart', onTap: () {}),
                const GapH(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
