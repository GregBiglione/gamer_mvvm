import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import '../utils/resource.dart';

abstract class AuthRepository {
  Future<Resource> login({required String email, required String password});
  Future<Resource> register(UserData userData);
}