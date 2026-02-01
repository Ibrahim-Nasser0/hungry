import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/shared/widgets/custom_botton.dart';
import 'package:hungry/core/shared/widgets/custom_text.dart';
import 'package:hungry/core/shared/widgets/custom_textfield.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (BuildContext context, SignupState state) {
            if (state is SignupSuccess) {
              GoRouter.of(
                context,
              ).pushReplacement(AppRouter.navBar, extra: state.user);
            } else if (state is SignupFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
          },

          builder: (context, state) {
            return Column(
              children: [
                CustomTextfield(hint: 'Name', controller: userNameController),
                SizedBox(height: 20.h),

                CustomTextfield(hint: 'Email', controller: emailController),
                SizedBox(height: 20.h),

                CustomTextfield(hint: 'Phone', controller: phoneController),
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

                state is SignupLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'Signup',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignupCubit>().signup(
                              params: SignupParams(
                                name: userNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                      ),

                SizedBox(height: 20.h),
                SignupWith(),
              ],
            );
          },
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
