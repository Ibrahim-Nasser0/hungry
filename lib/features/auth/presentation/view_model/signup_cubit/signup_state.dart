part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {
  const SignupInitial();
}

final class SignupLoading extends SignupState {
  const SignupLoading();
}

final class SignupFailure extends SignupState {
  final String errMessage;

  const SignupFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  const SignupSuccess({required this.user});

  @override
  List<Object> get props => [user];
}
