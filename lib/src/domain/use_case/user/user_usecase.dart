import 'package:gamer_mvvm/src/domain/use_case/user/get_user_by_id_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/update_user_usecase.dart';

class UserUseCase {
  final GetUserByIdUseCase getUserByIdUseCase;
  final UpdateUserUseCase updateUserUseCaseWithoutImage;

  UserUseCase({required this.getUserByIdUseCase,
    required this.updateUserUseCaseWithoutImage});
}