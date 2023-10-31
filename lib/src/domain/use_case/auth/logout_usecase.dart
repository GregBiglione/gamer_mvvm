import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  launch() => _authRepository.logout();
}