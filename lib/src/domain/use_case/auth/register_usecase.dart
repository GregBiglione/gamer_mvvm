import 'package:gamer_mvvm/src/domain/model/user_data.dart';

import '../../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  launch(UserData userData) => _authRepository.register(userData);
}