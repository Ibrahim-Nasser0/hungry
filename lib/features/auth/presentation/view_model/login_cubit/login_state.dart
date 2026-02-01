part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

final class LoginSuccess extends LoginState {
  final UserEntity user;

  const LoginSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}
