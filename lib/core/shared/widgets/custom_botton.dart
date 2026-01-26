import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    required this.onTap,
    this.style = false,
  });
  final String text;
  final double width;
  final VoidCallback onTap;
  final bool style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: style ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: CustomText(
            text: text,
            weight: FontWeight.bold,
            size: 18,
            color: style ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
