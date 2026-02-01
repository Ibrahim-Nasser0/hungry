import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  final String name;
  final String email;
  final String? image;
  final String? address;
  final String? visa;

  const UserProfileModel({
    required this.name,
    required this.email,
    this.image,
    this.address,
    this.visa,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        name: json['name'] as String,
        email: json['email'] as String,
        image: json['image'] as String?,
        address: json['address'] as String?,
        visa: json['Visa'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'image': image,
    'address': address,
    'Visa': visa,
  };

  @override
  List<Object?> get props => [name, email, image, address, visa];
}
