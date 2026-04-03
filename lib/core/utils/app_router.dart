import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/utils/service_locator.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:hungry/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:hungry/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:hungry/features/auth/presentation/views/login_view.dart';
import 'package:hungry/features/auth/presentation/views/signup_view.dart';
import 'package:hungry/features/auth/presentation/views/splash_view.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';
import 'package:hungry/features/product/presentation/views/product_details_view.dart';
import 'package:hungry/nav_bar.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String loginView = '/loginView';
  static const String signupView = '/signupView';

  static const String navBar = '/navBar';
  static const String productDetailsView = '/productDetailView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: loginView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                LoginCubit(loginUseCase: getIt<LoginUseCase>()),
            child: const LoginView(),
          );
        },
      ),

      GoRoute(
        path: signupView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SignupCubit(
              signupUseCase: getIt<SignupUseCase>(),
            ), //todo fixe this
            child: const SignupView(),
          );
        },
      ),

      GoRoute(
        path: navBar,
        builder: (BuildContext context, GoRouterState state) {
          final user = state.extra as UserEntity;
          return Navbar(user: user);
        },
      ),

      GoRoute(
        path: productDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          final product = state.extra as ProductEntite;
          return ProductDetailsView(product: product);
        },
      ),
    ],
  );
}
