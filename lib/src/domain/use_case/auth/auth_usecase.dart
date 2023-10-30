import 'package:gamer_mvvm/src/domain/use_case/auth/login_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/register_usecase.dart';

class AuthUseCase {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthUseCase({required this.loginUseCase, required this.registerUseCase });
}