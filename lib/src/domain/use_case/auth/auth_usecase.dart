import 'package:gamer_mvvm/src/domain/use_case/auth/login_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/register_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/user_session_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/logout_usecase.dart';

class AuthUseCase {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final UserSessionUseCase userSessionUseCase;
  final LogoutUseCase logoutUseCase;

  AuthUseCase({required this.loginUseCase, required this.registerUseCase,
    required this.userSessionUseCase, required this.logoutUseCase});
}