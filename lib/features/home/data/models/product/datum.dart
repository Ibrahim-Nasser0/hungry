import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? name;

  const Datum({this.id, this.name});

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
