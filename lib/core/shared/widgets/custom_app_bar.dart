import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.user});
  final UserEntity? user;

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
              text: 'Hello, ${user?.name ?? "null"}',
              weight: FontWeight.w500,
              color: AppColors.text,
            ),
          ],
        ),
        Spacer(),

        CircleAvatar(
          radius: 30.r,
          child: CachedNetworkImage(
            imageUrl: user?.image ?? '',

            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
