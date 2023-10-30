import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_state.dart';

import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterState _registerState = RegisterState();
  late Resource _response = Init();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  RegisterViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  RegisterState get registerState => _registerState;
  Resource get response => _response;

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

  void register() async {
    if (registerState.isValid()) {
      // Loading ---------------------------------------------------------------
      _response = Loading();
      notifyListeners();
      // Register --------------------------------------------------------------
      _response = await _authUseCase.registerUseCase.launch(_registerState.toUser());
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Reset ---------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}