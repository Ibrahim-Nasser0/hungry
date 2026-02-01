import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';

import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/domain/use_cases/signup_use_case.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  SignupCubit({required this.signupUseCase}) : super(const SignupInitial());

  Future<void> signup({required SignupParams params}) async {
    emit(SignupLoading());

    final result = await signupUseCase(params: params);

    result.fold(
      (failure) {
        emit(SignupFailure(errMessage: failure.errMessage));
        log(failure.errMessage);
      },
      (user) {
        log('signup success: ${user.email}');
        emit(SignupSuccess(user: user));
      },
    );
  }
}
