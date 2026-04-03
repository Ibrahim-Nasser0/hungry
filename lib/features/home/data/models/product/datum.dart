import 'package:equatable/equatable.dart';

class Datum extends Equatable {
   final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? rating;
  final String? price;
  const Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.price,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    rating: json['rating'] as String?,
    price: json['price'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
