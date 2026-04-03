import 'package:hungry/features/home/data/models/product/datum.dart'; // تأكد من استيراد الـ Datum
import 'package:hungry/features/home/data/models/product/product.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';

extension ProductMapper on Product {
  List<ProductEntite> toEntity() {
    return data?.map((datum) => datum.toEntity()).toList() ?? [];
  }
}

extension DatumMapper on Datum {
  ProductEntite toEntity() {
    return ProductEntite(
      id: id ?? 0,
      image: image ?? '',
      title: name ?? '',
      description: description ?? '',
      rating: double.tryParse(rating ?? '0') ?? 0.0,
      price: double.tryParse(price ?? '0.0'),
    );
  }
}
