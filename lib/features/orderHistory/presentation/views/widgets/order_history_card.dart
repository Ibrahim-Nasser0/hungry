import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/orderHistory/presentation/views/widgets/info_row.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoRow(label: 'Order Name', value: 'Hamburger'),
                InfoRow(label: 'Order Date', value: '2025/9/22'),
                InfoRow(label: 'Order Quantity', value: 'x 16'),
                InfoRow(label: 'Price', value: '20 \$'),
                GapH(10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: CustomText(
                    text: '           Reorder           ',
                    weight: FontWeight.w700,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ],
            ),

            Image.asset("assets/test/image 6.png", width: 140.w),
          ],
        ),
      ),
    );
  }
}
