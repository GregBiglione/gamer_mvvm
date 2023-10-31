import 'package:flutter/cupertino.dart';

import '../../../domain/use_case/auth/auth_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  HomeViewModel(this._authUseCase);

  // ---------------------------------------------------------------------------
  // Logout --------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  logout() async {
    await _authUseCase.logoutUseCase.launch();
  }
}