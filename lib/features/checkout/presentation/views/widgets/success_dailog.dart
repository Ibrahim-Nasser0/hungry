import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/shared/widgets/custom_botton.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/gaps.dart';

class SuccessDialog extends StatelessWidget {
  final String message = '''Your payment was successful.
A receipt for this purchase has\nbeen sent to your email.''';

  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primary,
            child: Icon(Icons.done, color: Colors.white, size: 50),
          ),
          GapH(10),
          CustomText(
            text: 'Success !',
            weight: FontWeight.w700,
            size: 30,
            color: AppColors.primary,
          ),
        ],
      ),

      content: CustomText(
        text: message,
        weight: FontWeight.w400,
        size: 14,
        color: AppColors.text,
      ),
      actions: [
        CustomButton(
          text: "Go Back",
          onTap: () {
            Navigator.of(context).pop();
          },
          style: true,
        ),
      ],
    );
  }
}
