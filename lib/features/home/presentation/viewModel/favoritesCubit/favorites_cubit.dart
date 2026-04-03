import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/presentation/viewModel/favoritesCubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
 FavoritesCubit() :  super(FavoritesState(false));

  void toggleFavorites() {
    emit(ToggleState(!state.isFavorite));
  }
}
