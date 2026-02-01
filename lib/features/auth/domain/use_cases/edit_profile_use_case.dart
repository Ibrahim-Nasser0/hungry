import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_erorrs/api_error.dart';
import 'package:hungry/core/use_cases/use_case.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

class EditProfileUseCase extends UseCase<UserEntity, UpdateProfileParams> {
 final AuthRepo authRepo;

  EditProfileUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call({required UpdateProfileParams params}) async {
   
  final result = await authRepo.updateProfile(params: params);

    return result.fold((failure) => Left(failure), (user) => Right(user));
  }
}
