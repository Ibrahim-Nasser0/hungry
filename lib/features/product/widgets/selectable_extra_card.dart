import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/shared/custom_text.dart';

class SelectableExtraCard extends StatelessWidget {
  const SelectableExtraCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,

      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // أو أي درجة مناسبة
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // أو أي درجة مناسبة
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),

            child: Image.asset(image),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                CustomText(
                  text: 'Tomato',
                  weight: FontWeight.w400,
                  color: Colors.white,
                  size: 14,
                ),
                Spacer(),
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
