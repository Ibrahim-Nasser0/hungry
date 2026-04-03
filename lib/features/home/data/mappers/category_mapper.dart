
import 'package:hungry/features/home/data/models/category/category.dart';
import 'package:hungry/features/home/domain/entities/category_entite.dart';

extension CategoryMapper on Category {
  List<CategoryEntite> toEntity() {
    return data
        .map((item) => CategoryEntite(id: item.id, name: item.name))
        .toList();
  }
}
