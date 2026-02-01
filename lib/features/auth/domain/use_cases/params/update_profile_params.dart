class UpdateProfileParams {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? image;

  UpdateProfileParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });
}
