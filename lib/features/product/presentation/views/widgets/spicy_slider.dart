import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/product/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:hungry/features/product/presentation/view_model/product_details_cubit/product_details_state.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

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
              weight: FontWeight.w600,
              // size: 18,
            ),
            const GapH(5),
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                return Slider(
                  min: 0,
                  max: 1,

                  value: state.spicy,
                  onChanged: (v) {
                    context.read<ProductDetailsCubit>().changeSpicyLevel(v);
                  },

                  activeColor: (state.spicy < 0.2)
                      ? const Color(0xFF66BB6A) 
                      : (state.spicy < 0.4)
                      ? const Color(0xFFFFC107) 
                      : (state.spicy < 0.6)
                      ? const Color(0xFFFF7043) 
                      : (state.spicy < 0.8)
                      ? const Color(0xFFE53935) 
                      : const Color(0xFFB71C1C), 
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
