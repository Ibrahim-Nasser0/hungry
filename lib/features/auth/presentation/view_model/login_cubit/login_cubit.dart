import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  Future<void> login({required LoginParams loginParms}) async {
    emit(LoginLoading());

    final result = await loginUseCase(params: loginParms);

    result.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.errMessage));
        log(failure.errMessage);
      },
      (user) {
        log("success: ${user.name}");
        emit(LoginSuccess(user: user));
      },
    );
  }
}
