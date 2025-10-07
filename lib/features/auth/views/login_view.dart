import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/login_form.dart';
import 'package:hungry/features/shared/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                SvgPicture.asset('assets/logo/Hungry.svg', color: Colors.white),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Welcome Back, Discover The Fast Food',
                  color: Colors.white,
                  weight: FontWeight.w500,
                ),

                SizedBox(height: 70.h),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
