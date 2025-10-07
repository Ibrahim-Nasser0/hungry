import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/shared/custom_botton.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Total', weight: FontWeight.w700, size: 18),
            GapH(5),
            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: AppColors.primary,
                  size: 30,
                ),
                CustomText(text: '18.19', weight: FontWeight.w400, size: 30),
              ],
            ),
          ],
        ),
        Spacer(),

        CustomButton(text: text, onTap: onTap, width: 200, style: true),
      ],
    );
  }
}
