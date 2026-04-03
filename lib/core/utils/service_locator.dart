import 'package:get_it/get_it.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/core/network/dio_clint.dart';
import 'package:hungry/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:hungry/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:hungry/features/auth/data/repos/auth_repo_impl.dart';
import 'package:hungry/features/auth/domain/repos/auth_repo.dart';
import 'package:hungry/features/auth/domain/use_cases/edit_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:hungry/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:hungry/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:hungry/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:hungry/features/home/data/repos/home_repo_impl.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';
import 'package:hungry/features/home/domain/use_cases/fetch_by_category_use_case.dart';
import 'package:hungry/features/home/domain/use_cases/fetch_categores_use_case.dart';
import 'package:hungry/features/home/domain/use_cases/search_products_use_case.dart';
import 'package:hungry/features/home/domain/use_cases/toggle_favorite_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dioClint: DioClint()),
  );

  //Auth Feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteData: getIt<AuthRemoteDataSource>()),
  );

  //End Auth Feature
  //SearchOrGetByCategoryUseCase
  //Home Feature
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteDataSource: getIt<HomeRemoteDataSource>()),
  );
  //End Home Feature

  ////Use Cases
  //Auth UseCases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<EditProfileUseCase>(
    () => EditProfileUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<FetchProfileUseCase>(
    () => FetchProfileUseCase(authRepo: getIt<AuthRepo>()),
  );
  //End Auth UseCases
  //Home UseCases
  getIt.registerLazySingleton<FetchCategoresUseCase>(
    () => FetchCategoresUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchByCategoryUseCase>(
    () => FetchByCategoryUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<ToggleFavoritesUseCase>(
    () => ToggleFavoritesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(homeRepo: getIt<HomeRepo>()),
  );
  //End Home UseCases
  ////End Use Cases
}
