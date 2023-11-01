import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import '../utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<UserData>> getUserById(String id);
  Future<Resource<bool>> updateWithoutImage(UserData userData);
}