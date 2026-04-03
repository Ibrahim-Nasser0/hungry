import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';
import 'package:hungry/features/home/presentation/viewModel/get_products_cubit/get_products_cubit.dart';
import 'package:hungry/features/home/presentation/views/widgets/category_filter.dart';
import 'package:hungry/features/home/presentation/views/widgets/product_grid.dart';

class ProductsAndCategory extends StatelessWidget {
  const ProductsAndCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryFilter(),
        const GapH(10),

        BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is GetProductsSuccess) {
              return ProductsGrid(products: state.products);
            } else if (state is GetProductsFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
