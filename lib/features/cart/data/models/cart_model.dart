class CartModel {
  final String image;
  final String title;
  final String description;
  final double price;
  int quantity;

  CartModel({
    required this.image,
    required this.title,
    required this.description,
    this.price = 0,
    this.quantity = 1,
  });

  // دالة copyWith لتسهيل التعديل على القيم
  CartModel copyWith({
    String? image,
    String? title,
    String? description,
    double? price,
    int? quantity,
  }) {
    return CartModel(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
