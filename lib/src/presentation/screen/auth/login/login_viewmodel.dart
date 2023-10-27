import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_state.dart';
import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  LoginState _loginState = LoginState();
  final FirebaseAuth _firebaseAuth;

  LoginViewModel(this._firebaseAuth);

  // Getters -------------------------------------------------------------------
  LoginState get loginState => _loginState;

  // Setters -------------------------------------------------------------------
  void changeEmail(String value) {
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if(!emailValid) {
      _loginState = _loginState.copyWith(email: const ValidationItem(
          error: "No es un email"));
    }
    else if(value.length >= 6) {
      _loginState = _loginState.copyWith(email: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _loginState = _loginState.copyWith(email: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _loginState = _loginState.copyWith(password: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _loginState = _loginState.copyWith(password: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Login ---------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  void login() async {
    if (loginState.isValid()) {
      print("Email: ${_loginState.email.value} \nPassword: ${_loginState.password.value}");
      final data = await _firebaseAuth.signInWithEmailAndPassword(
          email: _loginState.email.value,
          password: _loginState.password.value,
      );
      print("Data: $data");
    }
    else {
      print("El formulario no es valido");
    }
  }
}