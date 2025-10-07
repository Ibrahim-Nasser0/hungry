import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              SvgPicture.asset('assets/logo/Hungry.svg', color: Colors.white),
              SizedBox(height: 70.h),
              SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
