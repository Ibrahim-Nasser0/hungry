import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/core/utils/service_locator.dart';
import 'package:hungry/features/auth/domain/use_cases/edit_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:hungry/features/auth/presentation/view_model/Auth_cubit/auth_cubit.dart';
import 'package:hungry/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:hungry/features/auth/presentation/views/widgets/edit_profile.dart';
import 'package:hungry/core/shared/widgets/custom_botton.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 30)),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocProvider(
            create: (context) => ProfileCubit(
              getProfileUseCase: getIt<FetchProfileUseCase>(),
              editProfileUseCase: getIt<EditProfileUseCase>(),
            ),
            child: Column(
              children: [
                const ProfileInfo(),
                const GapH(30),
                const SettingsCard(),
                const GapH(30),
                CustomButton(
                  text: "Logout",
                  onTap: () async {
                    await context.read<AuthCubit>().logout();
                    GoRouter.of(context).pushReplacement(AppRouter.loginView);
                  },
                  style: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            CustomSettingsRow(
              icon: Icons.info_outline,
              title: 'Edit Profile',
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            Divider(color: AppColors.secondary),
            CustomSettingsRow(
              icon: Icons.email_outlined,
              title: 'Contact Us',
              onTap: () {
                // افتح صفحة التواصل مثلاً
              },
            ),
            Divider(color: AppColors.secondary),
            CustomSettingsRow(
              icon: Icons.info_outline,
              title: 'About App',
              onTap: () {},
            ),
            Divider(color: AppColors.secondary),
            NotificationToggle(),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: Image.asset('assets/icons/Mask group.png'),
                ),
                GapH(5),
                CustomText(
                  text: state.user.name,
                  weight: FontWeight.w700,
                  size: 25,
                ),
                CustomText(
                  text: state.user.email,
                  weight: FontWeight.w400,
                  size: 16,
                  color: AppColors.text,
                ),
              ],
            );
          } else if (state is ProfileFailure) {
            log(state.errMessage);
            return Center(child: Text(state.errMessage));
          } else if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Failed to load profile'));
          }
        },
      ),
    );
  }
}

class CustomSettingsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomSettingsRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationToggle extends StatefulWidget {
  const NotificationToggle({super.key});

  @override
  State<NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<NotificationToggle> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.notifications, color: AppColors.primary, size: 24.sp),
        GapW(5),
        CustomText(
          text: 'Push Notifications',
          weight: FontWeight.w600,
          size: 16.sp,
        ),
        const Spacer(),
        Switch(
          value: isEnabled,
          activeColor: AppColors.primary,
          inactiveThumbColor: AppColors.primary,

          onChanged: (value) {
            setState(() {
              isEnabled = value;
            });
            // تقدر تضيف هنا أي أكشن (مثلاً حفظ الإعداد)
            // print('Notifications: $isEnabled');
          },
        ),
      ],
    );
  }
}
