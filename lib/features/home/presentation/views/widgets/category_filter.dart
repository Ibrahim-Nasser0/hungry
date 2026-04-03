import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';
import 'package:hungry/features/home/presentation/viewModel/toggle_categoryCubit/toggle_category_cubit.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/features/home/presentation/viewModel/get_products_cubit/get_products_cubit.dart';
import 'package:hungry/features/home/presentation/viewModel/category_cubit/category_cubit.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key,});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLodaing) {
          return CircularProgressIndicator(color: AppColors.primary);
        } else if (state is CategoryFailure) {
          return NavigationDrawer(
            children: [Text('sorry ${state.errMessage}')],
          );
        } else if (state is CategorySuccess) {
          final List<CategoryEntite> category = state.categories;
          return BlocBuilder<ToggleCategoryCubit, ToggleCategoryState>(
            builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category.length, (index) {
                    final isSelected = state.selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ToggleCategoryCubit>()
                            .selectCategory(index);
                        context.read<GetProductsCubit>().getProducts(
                              categoryID: category[index].id,
                            );
                      },
                      child: Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(horizontal: 34.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CustomText(
                          text: category[index].name,
                          weight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.grey.shade300
                              : AppColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
