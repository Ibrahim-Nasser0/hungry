class ProductModel {
  final String image;
  final String title;
  final String description;
  final double rating;
  bool isFavorite;
  double? price;

  ProductModel({
    required this.image,
    required this.title,
    required this.description,
    this.rating = 0,
    this.isFavorite = false,
  });
}
