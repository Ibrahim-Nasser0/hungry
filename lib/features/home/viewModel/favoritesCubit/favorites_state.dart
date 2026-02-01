

class FavoritesState  {
  final bool isFavorite;
  const FavoritesState(this.isFavorite);
}

class ToggleState extends FavoritesState {
  const ToggleState(super.isFavorite);


}
