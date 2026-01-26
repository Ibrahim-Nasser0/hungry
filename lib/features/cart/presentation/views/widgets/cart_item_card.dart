import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/cart/data/models/cart_model.dart';
import 'package:hungry/features/cart/presentation/viewModel/cartCubit/cart_cubit.dart';
import 'package:hungry/features/cart/presentation/viewModel/cartCubit/cart_state.dart';
import 'package:hungry/features/cart/presentation/views/widgets/quantity_button.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.product});

  final CartModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image, width: 111.w),
                CustomText(text: product.title, weight: FontWeight.w700),
                CustomText(text: product.description, weight: FontWeight.w400),
              ],
            ),
            Spacer(),
            Column(
              children: [
                GapH(20),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is IncreaseProduct || current is DecreaseProduct,
                  builder: (context, state) {
                    return Row(
                      children: [
                        QuantityButton(
                          icon: Icons.remove,
                          onTap: () => context
                              .read<CartCubit>()
                              .decreaseProduct(product),
                        ),
                        GapW(30),
                        CustomText(
                          text: product.quantity.toString(),
                          weight: FontWeight.w700,
                        ),
                        GapW(30),
                        QuantityButton(
                          icon: Icons.add,
                          onTap: () => context
                              .read<CartCubit>()
                              .increaseProduct(product),
                        ),
                      ],
                    );
                  },
                ),

                GapH(40),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().removeProduct(product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: CustomText(
                    text: '      Remove      ',
                    weight: FontWeight.w700,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
