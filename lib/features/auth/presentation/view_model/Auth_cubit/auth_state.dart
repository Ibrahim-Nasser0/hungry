part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;

  const AuthAuthenticated({required this.user});
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

class AutoAuthFailure extends AuthState {
  final String errMessage;

  const AutoAuthFailure({required this.errMessage});
}

class AuthUnauthenticated extends AuthState {}
