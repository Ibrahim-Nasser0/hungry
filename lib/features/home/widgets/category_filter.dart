import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/logic/categoryCubit/category_cubit.dart';
import 'package:hungry/features/shared/custom_text.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key, required this.category});

  final List<String> category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(category.length, (index) {
              final isSelected = state.selectedIndex == index;

              return GestureDetector(
                onTap: () =>
                    context.read<CategoryCubit>().selectCategory(index),
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
                    text: category[index],
                    weight: isSelected ? FontWeight.bold : FontWeight.w500,
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
  }
}
