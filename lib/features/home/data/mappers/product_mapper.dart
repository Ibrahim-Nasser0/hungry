import 'package:hungry/features/home/data/models/product/datum.dart'; // تأكد من استيراد الـ Datum
import 'package:hungry/features/home/data/models/product/product.dart';
import 'package:hungry/features/home/domain/entities/product_entite.dart';

extension ProductMapper on Product {
  List<ProductEntite> toEntity() {
    // هنا نستدعي الـ Mapper الخاص بالـ Datum لكل عنصر في القائمة
    return data?.map((datum) => datum.toEntity()).toList() ?? [];
  }
}

// هذا هو الجزء الذي سيجعل كود الـ Repo يعمل معك
extension DatumMapper on Datum {
  ProductEntite toEntity() {
    return ProductEntite(
      image: image ?? '',
      title: name ?? '',
      description: description ?? '',
      rating: double.tryParse(rating ?? '0') ?? 0.0,
      price: double.tryParse(price ?? '0.0'),
    );
  }
}
