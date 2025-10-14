import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/gaps.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Payment methods', weight: FontWeight.w600, size: 20),
        GapH(10),
        Container(
          height: 80.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // شفاف شويه
                blurRadius: 10, // نعومة الضل
                spreadRadius: 1, // امتداد خفيف
                offset: const Offset(0, 4), // الضل تحت العنصر بشوية
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/icons/dollar Background Removed 1.png'),
              GapW(20),
              CustomText(
                text: 'Cash on Delivery',
                weight: FontWeight.w500,
                size: 20,
                color: Colors.white,
              ),
              const Spacer(),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                  // لون الدائرة الفاضية
                ),
                child: Radio<int>(
                  value: 1,
                  groupValue: 1, // لازم يكون نفس القيمة لو عايزها متفعّلة
                  onChanged: (_) {},
                  activeColor: Colors.white, // لون الدائرة الداخلية
                ),
              ),
            ],
          ),
        ),
        GapH(10),
        Container(
          height: 80.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color(0xffF3F4F6),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // شفاف شويه
                blurRadius: 10, // نعومة الضل
                spreadRadius: 1, // امتداد خفيف
                offset: const Offset(0, 4), // الضل تحت العنصر بشوية
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/icons/Visa.png', height: 33),
              GapW(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Debt Card',
                    weight: FontWeight.w500,
                    size: 14,
                  ),
                  CustomText(
                    text: '3566 **** **** 0505',
                    weight: FontWeight.w400,
                    color: AppColors.text,
                  ),
                ],
              ),
              const Spacer(),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                  // لون الدائرة الفاضية
                ),
                child: Radio<int>(
                  value: 1,
                  groupValue: 2, // لازم يكون نفس القيمة لو عايزها متفعّلة
                  onChanged: (_) {},
                  activeColor: Colors.white, // لون الدائرة الداخلية
                ),
              ),
            ],
          ),
        ),
        GapH(10),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: null,
              fillColor: MaterialStateProperty.all(AppColors.primary),
            ),
            CustomText(
              text: 'Save card details for future payments',
              weight: FontWeight.w400,
              color: AppColors.text,
              size: 15,
            ),
          ],
        ),
      ],
    );
  }
}
