import '../../repository/user_repository.dart';

class GetUserByIdOnceUseCase {
  final UserRepository _userRepository;

  GetUserByIdOnceUseCase(this._userRepository);

  launch(String id) => _userRepository.getUserByIdOnce(id);
}