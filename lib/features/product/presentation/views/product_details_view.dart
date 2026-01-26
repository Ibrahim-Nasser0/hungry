import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:hungry/features/product/presentation/views/widgets/side_options_section.dart';
import 'package:hungry/features/product/presentation/views/widgets/spicy_slider.dart';
import 'package:hungry/features/product/presentation/views/widgets/toppings_section.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';
import 'package:hungry/core/shared/widgets/total_price_section.dart';

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
