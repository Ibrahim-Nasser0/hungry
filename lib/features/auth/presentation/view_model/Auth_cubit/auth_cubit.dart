import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/logout_use_case.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LogoutUseCase logoutUseCase;
  final FetchProfileUseCase getProfileUseCase;
  AuthCubit({required this.logoutUseCase, required this.getProfileUseCase})
    : super(AuthInitial());

  Future<void> checkAuth() async {
    emit(AuthLoading());
    final token = await PrefHelper.getToken();
    if (token != null) {
      final result = await getProfileUseCase(params: const NoParams());
      result.fold(
        (failure) {
          emit(AuthUnauthenticated());
        },
        (user) {
          emit(AuthAuthenticated(user: user));
        },
      );
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> logout() async {
    await logoutUseCase(params: const NoParams());

    emit(AuthUnauthenticated());
  }
}
