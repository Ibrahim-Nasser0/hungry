import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/shared/custom_botton.dart';
import 'package:hungry/features/shared/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextfield(hint: 'Email Address', controller: emailController),
          SizedBox(height: 20.h),
          CustomTextfield(
            hint: 'Password',
            controller: passwordController,
            obscure: true,
          ),
          SizedBox(height: 20.h),

          CustomButton(
            text: 'Login',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // print('susces');
              }
            },
          ),
        ],
      ),
    );
  }
}
