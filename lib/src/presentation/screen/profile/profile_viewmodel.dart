import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';

import '../../../domain/model/user_data.dart';
import '../../../domain/use_case/auth/auth_usecase.dart';
import '../../../domain/utils/resource.dart';

class ProfileViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final UserUseCase _userUseCase;
  final AuthUseCase _authUseCase;

  ProfileViewModel(this._userUseCase, this._authUseCase) {
    getUserById();
  }

  getUserById() {
    final id = _authUseCase.userSessionUseCase.userSession?.uid ?? "";

    _userUseCase.getUserByIdUseCase.launch(id).listen((Resource<UserData> response) {
      if(response is Loading) {

      }
      else if(response is Error) {
        final data = response as Error;
        print("Error: ${data.error}");

      }
      else if(response is Success) {
        final data = response as Success<UserData>;
        print("Success: ${data.data.toJson()}");
      }
    });
  }
}