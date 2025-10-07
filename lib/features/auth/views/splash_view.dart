import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 290.h),
            SvgPicture.asset('assets/logo/Hungry.svg', color: Colors.white),
            Spacer(),
            Image.asset('assets/logo/spalsh_image.png'),
          ],
        ),
      ),
    );
  }
}
