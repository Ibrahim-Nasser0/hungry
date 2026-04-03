import 'package:equatable/equatable.dart';

sealed class FavoritesState extends Equatable {
  final bool isFavorite;
  const FavoritesState(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class ToggleState extends FavoritesState {
  const ToggleState(super.isFavorite);
}

class LoadingState extends FavoritesState {
  const LoadingState(super.isFavorite);
}

class ErrorState extends FavoritesState {
  final String errorMessage;
  const ErrorState(this.errorMessage) : super(false);
}
