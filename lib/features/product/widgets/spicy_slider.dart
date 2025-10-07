import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';

import 'package:hungry/features/product/logic/productDetailsCubit/product_details_cubit.dart';
import 'package:hungry/features/product/logic/productDetailsCubit/product_details_state.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/test/pngwing 12.png', height: 297.h),
        const Spacer(),
        Column(
          children: [
            const CustomText(
              text:
                  'Customize Your Burger\n to Your Tastes.\n Ultimate\n Experience',
              weight: FontWeight.normal,
              // size: 18,
            ),
            const GapH(5),
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                return Slider(
                  min: 0,
                  max: 1,
                  // divisions: 5,
                  value: state.spicy,
                  onChanged: (v) {
                    context.read<ProductDetailsCubit>().changeSpicyLevel(v);
                  },

                  activeColor: (state.spicy < 0.5)
                      ? AppColors.primary
                      : const Color.fromARGB(255, 108, 21, 14),
                );
              },
            ),
            const Row(
              children: [
                Text('🥶', style: TextStyle(fontSize: 20)),
                GapW(110),
                Text('🌶️', style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
