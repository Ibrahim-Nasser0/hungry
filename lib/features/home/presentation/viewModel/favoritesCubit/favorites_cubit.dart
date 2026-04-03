import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/domain/repos/home_repo.dart';
import 'package:hungry/features/home/presentation/viewModel/favoritesCubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final HomeRepo homeRepo;
  FavoritesCubit({required this.homeRepo}) : super(ToggleState(false));

  void toggleFavorites({required int productId}) async {
    emit(LoadingState(state.isFavorite));
    final result = await homeRepo.toggleFavorites(productId: productId);
    result.fold(
      (failure) => emit(ErrorState(failure.errMessage)),
      (r) => emit(ToggleState(!state.isFavorite)),
    );
  }
}
