class UserEntity {
  final String name;
  final String email;
  final String? image;
  final String? token;
  final String? visa;
  final String? address;

  UserEntity({
    required this.name,
    required this.email,
    this.image,
    this.token,
    this.visa,
    this.address,
  });

  factory UserEntity.fromJson(Map<String, dynamic> jsonData) => UserEntity(
    name: jsonData['name'] ?? '',
    email: jsonData['email'] ?? '',
    image: jsonData['image'] ?? '',
    token: jsonData['token'] ?? '',
    address: jsonData['address'] ?? '',
    visa: jsonData['Visa'] ?? '',
  );
}
