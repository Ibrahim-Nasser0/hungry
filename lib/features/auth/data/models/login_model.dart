import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String name;
  final String email;
  final String? token;
  final String? image;

  const LoginModel({
    this.token,
    required this.name,
    required this.email,
    this.image,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    if (json['name'] == null || json['email'] == null) {
      throw Exception('Required fields are missing in LoginModel JSON');
    }

    return LoginModel(
      token: json['token'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
    'image': image,
  };

  @override
  List<Object?> get props => [token, name, email, image];
}
