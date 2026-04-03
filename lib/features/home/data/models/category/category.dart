import 'package:equatable/equatable.dart';

import 'datum.dart';

class Category extends Equatable {
  final int? code;
  final String? message;
  final List<Datum> data;

  const Category({this.code, this.message, required this.data});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    code: json['code'] as int?,
    message: json['message'] as String?,
    data: List<Datum>.from((json['data'] as List).map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [code, message, data];
}
