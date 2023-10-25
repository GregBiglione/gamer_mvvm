import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

class RegisterState {
  ValidationItem username;
  ValidationItem email;
  ValidationItem password;
  ValidationItem confirmPassword;

  RegisterState({
    this.username = const ValidationItem(),
    this.email = const ValidationItem(),
    this.password = const ValidationItem(),
    this.confirmPassword = const ValidationItem(),
  });

  bool isValid() {
    if(username.value.isEmpty || username.error.isNotEmpty
        || email.value.isEmpty || email.error.isNotEmpty
        || password.value.isEmpty || password.error.isNotEmpty
        || confirmPassword.value.isEmpty || confirmPassword.error.isNotEmpty) {
      return false;
    }
    return true;
  }
}