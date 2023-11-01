import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';

import '../../../../domain/model/user_data.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';

class ProfileViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final UserUseCase _userUseCase;
  final AuthUseCase _authUseCase;

  ProfileViewModel(this._userUseCase, this._authUseCase) {
    getUserById();
  }

  Stream<Resource<UserData>> getUserById() {
    final id = _authUseCase.userSessionUseCase.userSession?.uid ?? "";

    return _userUseCase.getUserByIdUseCase.launch(id);
  }

  // ---------------------------------------------------------------------------
  // Logout --------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  logout() async {
    await _authUseCase.logoutUseCase.launch();
  }
}