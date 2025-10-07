import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo/Hungry.svg',
              height: 40.h,
              // width: 216.w,
              color: AppColors.primary,
            ),
            const GapH(5),
            CustomText(
              text: 'Hello, Ibrahim Nasser',
              weight: FontWeight.w500,
              color: AppColors.text,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30.r,
          child: Image.asset(
            'assets/icons/Mask group.png',
            height: 60.h,
            width: 60.w,
          ),
        ),
      ],
    );
  }
}
