import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import '../utils/resource.dart';

abstract class AuthRepository {
  User? get user;
  Future<Resource> login({required String email, required String password});
  Future<Resource> register(UserData userData);
}