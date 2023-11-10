import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_state.dart';

import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterState _registerState = RegisterState();
  //late Resource _response = Init();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<Resource> _responseController = StreamController<Resource>();

  RegisterViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  RegisterState get registerState => _registerState;
  Stream<Resource> get response => _responseController.stream;
  //Resource get response => _response;

  // Setters -------------------------------------------------------------------
  void changeUsername(String value) {
    _responseController.add(Init());
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
    _responseController.add(Init());
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
    _responseController.add(Init());
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
    _responseController.add(Init());
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
      _responseController.add(Loading());
      // Register --------------------------------------------------------------
      final data = await _authUseCase.registerUseCase.launch(_registerState.toUser());
      _responseController.add(data);
    }
  }
}