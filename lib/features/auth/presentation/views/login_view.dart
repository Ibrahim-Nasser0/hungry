import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/presentation/views/widgets/login_form.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 170.h),
              SvgPicture.asset(
                'assets/logo/Hungry.svg',
                color: AppColors.primary,
              ),
              SizedBox(height: 10.h),
              CustomText(
                text: 'Welcome Back, Discover The Fast Food',
                color: AppColors.secondary,
                weight: FontWeight.w500,
              ),
              SizedBox(height: 90.h),

              const AuthContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 600.h),
      width: double.maxFinite,

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(40.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: Column(
        children: [
          LoginForm(),
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account?',
                style: TextStyle(color: Colors.white70, fontSize: 18.sp),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.signupView);
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          OutlinedButton.icon(
            onPressed: () {
              GoRouter.of(context).pushReplacement(
                AppRouter.navBar,
                extra: UserEntity(name: "Guest", email: "Guest"),
              );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white.withOpacity(0.6)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.white70,
              size: 20.sp,
            ),
            label: Text(
              'Continue as Guest',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
