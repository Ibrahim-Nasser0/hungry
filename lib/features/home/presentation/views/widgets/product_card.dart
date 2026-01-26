import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/home/viewModel/favoritesCubit/favorites_cubit.dart';
import 'package:hungry/features/home/viewModel/favoritesCubit/favorites_state.dart';
import 'package:hungry/features/product/presentation/views/product_details_view.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) {
              return ProductDetailsView(product: product);
            },
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 170.w,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(product.image, width: 120.w)),
              CustomText(
                text: product.title,
                weight: FontWeight.bold,
                color: AppColors.secondary,
              ),

              CustomText(
                text: product.description,
                weight: FontWeight.w300,
                color: AppColors.secondary,
              ),
              const GapH(5),

              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFF9633), size: 20.sp),
                  const GapW(5),
                  CustomText(
                    text: product.rating.toString(),
                    weight: FontWeight.w500,
                  ),
                  Spacer(),

                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          context.read<FavoritesCubit>().toggleFavorites();
                          product.isFavorite = state.isFavorite;
                        },
                        
                        child: Icon(
                          product.isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          size: 25.sp,
                          color: product.isFavorite ? Colors.red : null,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
