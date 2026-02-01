import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/core/use_cases/no_params.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/edit_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final EditProfileUseCase editProfileUseCase;

  UserEntity? currentUser;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.editProfileUseCase,
  }) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await getProfileUseCase(params: const NoParams());
    result.fold(
      (failure) => emit(ProfileFailure(errMessage: failure.errMessage)),
      (user) {
        currentUser = user;
        return emit(ProfileSuccess(user: user));
      },
    );
  }

  Future<void> updateProfile(UpdateProfileParams updatedUser) async {
    emit(ProfileLoading());
    final result = await editProfileUseCase(params: updatedUser);
    result.fold(
      (failure) => emit(ProfileFailure(errMessage: failure.errMessage)),
      (user) {
        currentUser = user;
        return emit(ProfileSuccess(user: user));
      },
    );
  }
}
