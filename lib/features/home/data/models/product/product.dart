import 'package:equatable/equatable.dart';

import 'datum.dart';

class Product extends Equatable {
  final int? code;
  final String? message;
  final List<Datum>? data;

  const Product({this.code, this.message, this.data});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    code: json['code'] as int?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [code, message, data];
}
