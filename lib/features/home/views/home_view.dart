import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/data/product_model.dart';
import 'package:hungry/features/home/logic/categoryCubit/category_cubit.dart';
import 'package:hungry/features/home/logic/favoritesCubit/favorites_cubit.dart';
import 'package:hungry/features/home/widgets/category_filter.dart';
import 'package:hungry/features/shared/custom_app_bar.dart';
import 'package:hungry/features/home/widgets/product_grid.dart';
import 'package:hungry/features/home/widgets/search.dart';
import 'package:hungry/features/shared/gaps.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const List<String> category = ['All', 'Combo', 'Sliders', 'Classic'];

  static List<ProductModel> products = [
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
    ProductModel(
      image: 'assets/test/image 6.png',
      title: 'Cheeseburger',
      description: "Wendy's Burger",
      rating: 4.5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],

      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const GapH(73),
                const CustomAppBar(),
                const GapH(10),
                const Search(),
                const GapH(10),
                const CategoryFilter(category: category),
                const GapH(10),
                ProductsGrid(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
