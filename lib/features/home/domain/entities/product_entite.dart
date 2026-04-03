class ProductEntite {
  final int id;
  final String image;
  final String title;
  final String description;
  final double rating;
  bool isFavorite;
  double? price;

  ProductEntite({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    this.rating = 0,
    this.isFavorite = false,
    this.price,
 
  });
}
