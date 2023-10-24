import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_state.dart';
import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  LoginState _loginState = LoginState();

  // Getters -------------------------------------------------------------------
  LoginState get loginState => _loginState;

  // Setters -------------------------------------------------------------------
  void changeEmail(String value) {
    _loginState = _loginState.copyWith(email: ValidationItem(value: value));
    notifyListeners();
  }

  void changePassword(String value) {
    _loginState = _loginState.copyWith(password: ValidationItem(value: value));
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Login ---------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  void login() {
    print("Email: ${_loginState.email.value} \nPassword: ${_loginState.password.value}");
  }
}