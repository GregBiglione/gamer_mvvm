import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({required String email, required String password}) => _authRepository.login(
    email: email,
    password: password,
  );
}