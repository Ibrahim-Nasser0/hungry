import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/shared/widgets/custom_botton.dart';
import 'package:hungry/core/shared/widgets/custom_textfield.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/features/auth/presentation/view_model/login_cubit/login_cubit.dart';

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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }

        if (state is LoginSuccess) {
          GoRouter.of(
            context,
          ).pushReplacement(AppRouter.navBar, extra: state.user);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextfield(
                keyboardType: TextInputType.emailAddress,
                validator: (email) => emailValidator(email: email),
                hint: 'Email Address',
                controller: emailController,
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                keyboardType: TextInputType.visiblePassword,
                validator: (password) => passwordValidator(password: password),
                hint: 'Password',
                controller: passwordController,
                obscure: true,
              ),
              SizedBox(height: 20.h),
              state is LoginLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: 'Login',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            loginParms: LoginParams(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
