import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/repository/user_repository.dart';

class UpdateImageUseCase {
  final UserRepository _userRepository;

  UpdateImageUseCase(this._userRepository);

  launch(UserData userData, File image) => _userRepository.updateWithImage(
      userData, image);
}