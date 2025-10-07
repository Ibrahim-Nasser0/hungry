class CartModel {
  final String image;
  final String title;
  final String description;

  double? price;
  int? quantity;

  CartModel({
    required this.image,
    required this.title,
    required this.description,

    this.quantity = 0,
  });
}
