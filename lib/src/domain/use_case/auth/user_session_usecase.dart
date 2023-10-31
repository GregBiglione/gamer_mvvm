import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';

class UserSessionUseCase {
  final AuthRepository _authRepository;

  UserSessionUseCase(this._authRepository);

  User? get userSession => _authRepository.user;
}