import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/home/viewModel/categoryCubit/category_cubit.dart';
import 'package:hungry/features/home/viewModel/favoritesCubit/favorites_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/category_filter.dart';
import 'package:hungry/core/shared/widgets/custom_app_bar.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_grid.dart';
import 'package:hungry/features/home/presentation/views/widgets/search.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final UserEntity user;
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
                CustomAppBar(user: user,),
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
