import 'package:hungry/features/auth/data/models/login_model.dart';
import 'package:hungry/features/auth/data/models/user_profile_model.dart';

import 'package:hungry/features/auth/domain/entities/user_entity.dart';

extension UserMapper on LoginModel {
  UserEntity toEntity() {
    return UserEntity(name: name, email: email, image: image, token: token,);
  }
}

extension UserProfileMapper on UserProfileModel {
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      image: image??"",
      visa: visa??"",
      address: address ?? "",
    );
  }
}
