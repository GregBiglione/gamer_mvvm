import 'package:gamer_mvvm/src/domain/repository/user_repository.dart';

import '../../model/user_data.dart';
import '../../utils/resource.dart';

class GetUserByIdUseCase {
  final UserRepository _userRepository;

  GetUserByIdUseCase(this._userRepository);

  Stream<Resource<UserData>> launch(String id) => _userRepository.getUserById(id);
}