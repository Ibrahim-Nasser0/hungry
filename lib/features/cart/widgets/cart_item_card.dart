import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/cart/data/cart_model.dart';
import 'package:hungry/features/cart/widgets/quantity_button.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

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
                Row(
                  children: [
                    QuantityButton(icon: Icons.remove),
                    GapW(30),
                    CustomText(
                      text: product.quantity.toString(),
                      weight: FontWeight.w700,
                    ),
                    GapW(30),
                    QuantityButton(icon: Icons.add),
                  ],
                ),
                GapH(40),
                ElevatedButton(
                  onPressed: () {},
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
