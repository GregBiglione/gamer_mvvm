import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_state.dart';
import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

import '../../../../domain/use_case/auth/auth_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  LoginState _loginState = LoginState();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<Resource> _responseController = StreamController<Resource>();

  LoginViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  LoginState get loginState => _loginState;
  Stream<Resource> get response => _responseController.stream;

  // Setters -------------------------------------------------------------------
  void changeEmail(String value) {
    _responseController.add(Init());
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
    _responseController.add(Init());
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
      // Loading ---------------------------------------------------------------
      _responseController.add(Loading());
      // Login -----------------------------------------------------------------
      final data = await _authUseCase.loginUseCase.launch(
        email: _loginState.email.value,
        password: _loginState.password.value,
      );
      _responseController.add(data);
    }
  }
}