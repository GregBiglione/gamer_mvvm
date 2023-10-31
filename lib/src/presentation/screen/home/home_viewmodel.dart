import 'package:flutter/cupertino.dart';

import '../../../domain/use_case/auth/auth_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  int _currentIndex;

  HomeViewModel(this._authUseCase, this._currentIndex);

  // Getters -------------------------------------------------------------------
  int get currentIndex => _currentIndex;

  // Setters -------------------------------------------------------------------
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Logout --------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  logout() async {
    await _authUseCase.logoutUseCase.launch();
  }
}