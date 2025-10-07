import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/features/shared/custom_botton.dart';
import 'package:hungry/features/shared/custom_text.dart';
import 'package:hungry/features/shared/custom_textfield.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        
        child: Column(
          children: [
            CustomTextfield(hint: 'Email', controller: emailController),
            SizedBox(height: 20.h),

            CustomTextfield(hint: 'UserName', controller: userNameController),
            SizedBox(height: 20.h),

            CustomTextfield(
              hint: 'Password',
              controller: passwordController,
              obscure: true,
            ),
            SizedBox(height: 20.h),

            CustomTextfield(
              hint: 'Confirm Password',
              controller: confirmPasswordController,
              obscure: true,
            ),
            SizedBox(height: 20.h),

            CustomButton(
              text: 'Signup',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // print('susces');
                }
              },
            ),

            SizedBox(height: 20.h),
            SignupWith(),
          ],
        ),
      ),
    );
  }
}

class SignupWith extends StatelessWidget {
  const SignupWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'Or Signup With',
          weight: FontWeight.w500,
          color: Colors.white,
          size: 18,
        ),

        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/google_icon.svg'),
            SizedBox(width: 30.w),

            SvgPicture.asset('assets/icons/Facebook_icon.svg'),
            SizedBox(width: 30.w),

            SvgPicture.asset('assets/icons/apple_icon.svg'),
          ],
        ),
      ],
    );
  }
}
