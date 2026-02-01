part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}


final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  const ProfileFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

final class ProfileSuccess extends ProfileState {
  final UserEntity user;

  const ProfileSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}
