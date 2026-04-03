import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = AppColors.secondary,
    required this.weight,
    this.size = 16,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final Color color;
  final FontWeight weight;
  final double size;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      text,

      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
        fontFamily: 'Roboto',
      ),
    );
  }
}
