import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_state.dart';

import '../../../utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterState _registerState = RegisterState();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Getters -------------------------------------------------------------------
  RegisterState get registerState => _registerState;

  // Setters -------------------------------------------------------------------
  void changeUsername(String value) {
    if(value.length >= 3) {
      _registerState = _registerState.copyWith(username: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _registerState = _registerState.copyWith(username: const ValidationItem(
          error: "Al menos 3 caracteres"));
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if(!emailValid) {
      _registerState = _registerState.copyWith(email: const ValidationItem(
          error: "No es un email"));
    }
    else if (value.length >= 6) {
      _registerState = _registerState.copyWith(email: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _registerState = _registerState.copyWith(email: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _registerState = _registerState.copyWith(password: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _registerState = _registerState.copyWith(password: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  void changeConfirmPassword(String value) {
    if (value.length >= 6) {
      _registerState = _registerState.copyWith(confirmPassword: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _registerState = _registerState.copyWith(confirmPassword: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Register ------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  void register() {
    if (registerState.isValid()) {
      print("Username: ${registerState.username.value}\nEmail: ${registerState.email.value}\nPassword: ${registerState.password.value}\nConfirm password: ${registerState.confirmPassword.value} \n");
    }
    else {
      print("El formulario no es valido");
    }
  }
}