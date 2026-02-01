import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/features/auth/presentation/view_model/Auth_cubit/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkAuth();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    // GoRouter.of(context).pushReplacement(AppRouter.loginView);
  }

  // ignore: unused_element
  // Future<void> _checkTokenAndNavigate() async {
  //   final token = await PrefHelper.getToken();

  //   await Future.delayed(const Duration(milliseconds: 1800));

  //   if (token != null) {
  //     GoRouter.of(context).pushReplacement(AppRouter.navBar);
  //   } else {
  //     GoRouter.of(context).pushReplacement(AppRouter.loginView);
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          final user = state.user;
          GoRouter.of(context).pushReplacement(AppRouter.navBar, extra: user);
        } else if (state is AutoAuthFailure || state is AuthUnauthenticated) {
          GoRouter.of(context).pushReplacement(AppRouter.loginView);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 250.h),

                SvgPicture.asset(
                  'assets/logo/Hungry.svg',
                  color: Colors.white,
                  width: 280.w,
                ),

                const Spacer(),

                SlideTransition(
                  position: _slideAnimation,
                  child: Image.asset(
                    'assets/logo/spalsh_image.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
