String? emailValidator({required email}) {
  if (email == null || email.isEmpty) {
    return 'Please Fill Email';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return 'Please Enter Valid Email';
  }
  return null;
}

String? passwordValidator({required password}) {
  if (password == null || password.isEmpty) {
    return 'Please Fill Password';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

String? confimPasswordValidator({required confimPassword, required password}) {
  if (confimPassword == null || confimPassword.isEmpty) {
    return 'Please Fill Confirm Password';
  }
  if (confimPassword != password) {
    return 'Password and Confirm Password must be the same';
  }
  return null;
}

String? phoneValidator({required String phoneNumber}) {
  if (phoneNumber.isEmpty) {
    return 'Please Fill Phone Number';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
    return 'Phone must be numbers only';
  }
  if (phoneNumber.contains("010") ||
      phoneNumber.contains("011") ||
      phoneNumber.contains("012") ||
      phoneNumber.contains("015")) {
    return 'Phone must start with 010, 011, 012, or 015';
  }
  if (phoneNumber.length < 11) {
    return 'The Phone Number must consist of 11 digits';
  }
  return null;
}

String? nameValidator({required name}) {
  if (name == null || name.isEmpty) {
    return 'Please Fill Name';
  }
  if (name.length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}