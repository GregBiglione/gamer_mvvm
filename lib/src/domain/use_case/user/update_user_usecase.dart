import 'package:gamer_mvvm/src/domain/model/user_data.dart';

import '../../repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);

  launch(UserData userData) => _userRepository.updateWithoutImage(userData);
}