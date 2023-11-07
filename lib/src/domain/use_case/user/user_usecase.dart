import 'package:gamer_mvvm/src/domain/use_case/user/get_user_by_id_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/update_image_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/update_user_usecase.dart';

import 'get_user_by_id_once_usecase.dart';

class UserUseCase {
  final GetUserByIdUseCase getUserByIdUseCase;
  final UpdateUserUseCase updateUserUseCaseWithoutImage;
  final UpdateImageUseCase updateImageUseCase;
  final GetUserByIdOnceUseCase getUserByIdOnceUseCase;

  UserUseCase({required this.getUserByIdUseCase,
    required this.updateUserUseCaseWithoutImage, required this.updateImageUseCase,
    required this.getUserByIdOnceUseCase});
}