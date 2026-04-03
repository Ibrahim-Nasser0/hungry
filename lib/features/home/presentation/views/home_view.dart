import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/home/presentation/viewModel/toggle_categoryCubit/toggle_category_cubit.dart';
import 'package:hungry/features/home/presentation/viewModel/favoritesCubit/favorites_cubit.dart';
import 'package:hungry/core/shared/widgets/custom_app_bar.dart';
import 'package:hungry/features/home/presentation/views/widgets/products_and_category.dart';
import 'package:hungry/features/home/presentation/views/widgets/search.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ToggleCategoryCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],

      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const GapH(73),
                  CustomAppBar(user: user),
                  const GapH(10),
                  const Search(),
                  const GapH(10),
                  const ProductsAndCategory(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
