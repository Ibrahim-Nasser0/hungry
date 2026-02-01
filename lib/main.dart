import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/utils/app_router.dart';
import 'package:hungry/core/utils/service_locator.dart';
import 'package:hungry/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/logout_use_case.dart';

import 'package:hungry/features/auth/presentation/view_model/Auth_cubit/auth_cubit.dart';

void main() async {
  setupServiceLocator();
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(
        logoutUseCase: getIt<LogoutUseCase>(),
        getProfileUseCase: getIt<GetProfileUseCase>(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),

      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
