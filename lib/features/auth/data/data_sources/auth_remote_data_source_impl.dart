import 'package:hungry/core/network/api_endpoints.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:hungry/features/auth/data/mappers/user_profile_mapper.dart';
import 'package:hungry/features/auth/data/models/login_model.dart';
import 'package:hungry/features/auth/data/models/user_profile_model.dart';
import 'package:hungry/features/auth/domain/entities/user_entity.dart';
import 'package:hungry/features/auth/domain/use_cases/params/login_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/signup_params.dart';
import 'package:hungry/features/auth/domain/use_cases/params/update_profile_params.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService _apiService;
  @override
  AuthRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<UserEntity> fetchProfile() async {
    final response = await _apiService.get(endPoint: ApiEndpoints.getProfile);

    final user = UserProfileModel.fromJson(response.data['data']);
    return user.toEntity();
  }

  @override
  Future<UserEntity> login({required LoginParams params}) async {
    final response = await _apiService.post(
      endPoint: ApiEndpoints.login,
      data: {'email': params.email, 'password': params.password},
    );

    final user = LoginModel.fromJson(response.data['data']);

    return user.toEntity();
  }

  @override
  Future<void> logout() async {
    await _apiService.post(endPoint: ApiEndpoints.logout, data: {});
  }

  @override
  Future<UserEntity> register({required SignupParams params}) async {
    final response = await _apiService.post(
      endPoint: ApiEndpoints.register,
      data: {
        'name': params.name,
        'email': params.email,
        'phone': params.phone,
        'password': params.password,
        'image': params.image,
      },
    );
    final user = LoginModel.fromJson(response.data['data']);
    return user.toEntity();
  }

  @override
  Future<UserEntity> updateProfile({
    required UpdateProfileParams params,
  }) async {
    final response = await _apiService.post(
      endPoint: ApiEndpoints.updateProfile,
      data: {
        'name': params.name,
        'email': params.email,
        'phone': params.phone,
        'password': params.password,
        'image': params.image,
      },
    );
    final user = LoginModel.fromJson(response.data['data']);
    return user.toEntity();
  }
}
